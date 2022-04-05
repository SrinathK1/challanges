# Projects

This module helps to create

The resources/services/activations/deletions that this module will create/trigger are:

- GCP project creation
- Attach the project to a billing account
- Add a lien on a project to avoid accidental deletion
- Add labels
- Add IAM members to associate with particular roles at project level

## Service Accounts

A service account with the following roles must be used to provision
the resources of this module:

- Project Creator: `roles/resourcemanager.projectCreator`
- Project Deleter: `roles/resourcemanager.projectDeleter`
- Billing Account User: `roles/billing.user`

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.45, < 4.0 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | >= 3.45, < 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | >= 3.45, < 4.0 |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_project.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project) | resource |
| [google_project_default_service_accounts.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_default_service_accounts) | resource |
| [google_project_iam_binding.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_binding) | resource |
| [google_project_service.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_service) | resource |
| [google_resource_manager_lien.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/resource_manager_lien) | resource |
| [random_id.this](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [google_billing_account.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/billing_account) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_billing_account"></a> [billing\_account](#input\_billing\_account) | The name of the billing account. | `string` | `""` | no |
| <a name="input_project_lien_origin"></a> [project\_lien\_origin](#input\_project\_lien\_origin) | A stable, user-visible/meaningful string identifying the origin of the Lien, intended to be inspected programmatically. Maximum length of 200 characters. | `string` | `"terraform"` | no |
| <a name="input_project_lien_reason"></a> [project\_lien\_reason](#input\_project\_lien\_reason) | Concise user-visible strings indicating why an action cannot be performed on a resource.  Maximum length of 200 characters. | `string` | `"Don't delete"` | no |
| <a name="input_projects"></a> [projects](#input\_projects) | The list of project details | <pre>list(object({<br>    parent_id = string<br>    name      = string<br>    labels    = optional(map(any))<br>    lien      = optional(bool)<br>    services  = optional(list(string))<br>    roles_with_members = optional(list(object({<br>      role    = string<br>      members = list(string)<br>    })))<br>    skip_delete         = optional(bool)<br>    auto_create_network = optional(bool)<br>  }))</pre> | <pre>[<br>  {<br>    "auto_create_network": false,<br>    "labels": {},<br>    "lien": false,<br>    "name": null,<br>    "parent_id": null,<br>    "roles_with_members": [<br>      {<br>        "members": [],<br>        "role": ""<br>      }<br>    ],<br>    "services": [],<br>    "skip_delete": true<br>  }<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_projects"></a> [projects](#output\_projects) | n/a |
<!-- END_TF_DOCS -->
