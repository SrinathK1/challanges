variable "billing_account" {
  type        = string
  description = "The name of the billing account."
  default     = ""
}

variable "projects" {
  type = list(object({
    parent_id = string
    name      = string
    labels    = optional(map(any))
    lien      = optional(bool)
    services  = optional(list(string))
    roles_with_members = optional(list(object({
      role    = string
      members = list(string)
    })))
    skip_delete         = optional(bool)
    auto_create_network = optional(bool)
  }))
  description = "The list of project details"
  default = [
    {
      parent_id = null
      name      = null
      labels    = {}
      lien      = false
      services  = []
      roles_with_members = [
        {
          role    = ""
          members = []
        }
      ]
      skip_delete         = true
      auto_create_network = false
    }
  ]
}

variable "project_lien_reason" {
  type        = string
  description = "Concise user-visible strings indicating why an action cannot be performed on a resource.  Maximum length of 200 characters."
  default     = "Don't delete"
}

variable "project_lien_origin" {
  type        = string
  description = "A stable, user-visible/meaningful string identifying the origin of the Lien, intended to be inspected programmatically. Maximum length of 200 characters."
  default     = "terraform"
}
