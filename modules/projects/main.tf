locals {
  projects = {
    for project in var.projects : replace(replace(lower(project["name"]), " ", "-"), "/-+/", "-") => project
  }

  project_role_members = flatten([
    for project_key, project in local.projects : [
      for roles_with_members in local.projects[project_key]["roles_with_members"] : {
        project_key = project_key
        role        = roles_with_members["role"]
        members     = roles_with_members["members"]
      }
    ] if local.projects[project_key]["roles_with_members"] != null
  ])

  project_services = flatten([
    for project_key, project in local.projects : [
      for service in local.projects[project_key]["services"] : {
        project_key         = project_key
        service             = service
        project_service_key = format("%s-%s", project_key, replace(service, ".", "-"))
      }
    ] if local.projects[project_key]["services"] != null
  ])
}

resource "random_id" "this" {
  for_each = local.projects

  byte_length = 2
}

data "google_billing_account" "this" {
  display_name = var.billing_account
  open         = true
}

# Create projects
resource "google_project" "this" {
  for_each = local.projects

  name                = each.value["name"]
  project_id          = substr(format("%s-%s", replace(replace(lower(each.value["name"]), " ", "-"), "/-+/", "-"), random_id.this[each.key].hex), 0, 30)
  org_id              = split("/", each.value["parent_id"])[0] == "organizations" ? split("/", each.value["parent_id"])[1] : null
  folder_id           = split("/", each.value["parent_id"])[0] == "folders" ? split("/", each.value["parent_id"])[1] : null
  billing_account     = data.google_billing_account.this.id
  auto_create_network = each.value["auto_create_network"]
  skip_delete         = each.value["skip_delete"]

  labels = {
    for key, val in each.value["labels"] : replace(lower(key), " ", "_") => replace(lower(val), " ", "_")
  }
}

# Associate IAM roles with members
resource "google_project_iam_binding" "this" {
  for_each = {
    for roles_with_members in local.project_role_members : format("%s-%s", roles_with_members["project_key"], split("/", roles_with_members["role"])[1]) => roles_with_members
  }

  project = google_project.this[each.value["project_key"]].project_id
  role    = each.value.role
  members = each.value.members
}

# Enable required service APIs
resource "google_project_service" "this" {
  for_each = {
    for project_service in local.project_services : project_service["project_service_key"] => project_service
  }

  project = google_project.this[each.value["project_key"]].project_id
  service = each.value["service"]

  disable_dependent_services = false
}

# Add project lien
resource "google_resource_manager_lien" "this" {
  for_each = {
    for project_key, project in local.projects : project_key => project if project["lien"] == true
  }

  parent = "projects/${google_project.this[each.key].number}"
  restrictions = [
    "resourcemanager.projects.delete"
  ]
  origin = var.project_lien_origin
  reason = var.project_lien_reason
}

# Remove default service accounts
resource "google_project_default_service_accounts" "this" {
  for_each = local.projects

  project = google_project.this[each.key].project_id
  action  = "DEPRIVILEGE"
}
