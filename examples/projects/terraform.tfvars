# domain_name     = "ganeshkaila.com"
billing_account = "My Billing Account"
projects = [
  {
    parent_id = "folders/117871679712"
    name      = "Metix Medical Test - Dev"
    labels = {
      "Project Owner" = "Metix Medical",
      "Environment"   = "Development",
    }
    # services = [
    #   "compute.googleapis.com",
    #   "iam.googleapis.com"
    # ]
    # roles_with_members = [
    #   {
    #     role = "role/editor",
    #     members = [
    #       "user:me@ganeshkaila.com"
    #     ]
    #   },
    #   {
    #     role = "role/owner",
    #     members = [
    #       "user:me@ganeshkaila.com"
    #     ]
    #   }
    # ]
  },
  {
    parent_id = "folders/117871679712"
    name      = "Metix Medical Test - Prod"
    labels = {
      "Project Owner" = "Metix Medical",
      "Environment"   = "Production",
    }
    services = [
      "compute.googleapis.com",
      "iam.googleapis.com"
    ]
    roles_with_members = [
      {
        role = "roles/editor",
        members = [
          "user:me@ganeshkaila.com"
        ]
      },
      {
        role = "roles/owner",
        members = [
          "user:me@ganeshkaila.com"
        ]
      }
    ]
    lien = true
  }
]
