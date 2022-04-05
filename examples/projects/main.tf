terraform {
  experiments = [module_variable_optional_attrs]
}

module "project" {
  source = "./../../modules/projects"

  billing_account = var.billing_account
  projects        = var.projects
}
