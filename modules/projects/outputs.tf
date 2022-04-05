output "projects" {
  value = [
    for project_key, project in local.projects : {
      name                = google_project.this[project_key].name
      project_id          = google_project.this[project_key].id
      number              = google_project.this[project_key].number
      labels              = google_project.this[project_key].labels
      folder_id           = google_project.this[project_key].folder_id
      org_id              = google_project.this[project_key].org_id
      skip_delete         = google_project.this[project_key].skip_delete
      auto_create_network = google_project.this[project_key].auto_create_network
      billing_account     = google_project.this[project_key].billing_account
      enabled_services = flatten([
        for project_service_key, project_service in google_project_service.this : project_service["service"] if project_service["project"] == google_project_service.this[project_service_key]["project"]
      ])
      iam_bindings = flatten([
        for project_iam_binding_key, project_iam_binding in google_project_iam_binding.this : {
          role    = project_iam_binding["role"]
          members = project_iam_binding["members"]
        } if project_iam_binding["project"] == google_project_iam_binding.this[project_iam_binding_key]["project"]
      ])
    }
  ]
}
