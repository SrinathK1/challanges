# terraform-searce-modules

It contains all the terraform modules required to configure GCP infrastructure for various customer needs.

## Servie Accounts

Use the following commands to create a least privileged service account for terraform to use.

1. Create a service account as shown,

   ```console
   $ gcloud iam service-accounts create <service-account-name> --display-name=<service-account-display-name>
   ```

2. Using GCP Console or `gcloud`, add the required IAM roles to the service account.

3. Create service account keys on your local machine to use `terraform`

   ```console
   $ gcloud iam service-accounts keys create key.json --iam-account=<service-account-name>@<project-id>.iam.gserviceaccount.com
   ```

4. Setup `GOOGLE_APPLICATION_CREDENTIALS` environment variable

   ```console
   $ export GOOGLE_APPLICATION_CREDENTIALS=`pwd`/key.json

   ```

## Static Code Analysis

Use `checkov` to perform static code analysis for terraform modules. For installation steps, refer to (bridgecrewio/checkov)[https://github.com/bridgecrewio/checkov]

```
$ terraform init
$ terraform plan -out tf.plan
$ terraform show -json tf.plan  > tf.json
$ checkov -f tf.json
```

## Generate Terraform Docs

1. Using `terraform-docs` tool, generate `README.md` file with the defined inputs and outputs, etc.

   ```console
   $ terraform-docs markdown --output-file=<path/to/README.md> --output-mode=inject <path/to/module>

   ```

   For example:

   If you're using the command from the same location of the module, you can directly run the following command.

   ```console
   $ terraform-docs markdown --output-file=README.md --output-mode=inject .
   ```
