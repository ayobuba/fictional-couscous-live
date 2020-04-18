remote_state {
  backend = "s3"
  generate = {
    path = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket = "up-running-boiler-state"
    key = "${path_relative_to_include()}/terraform.tfstate"
    region = "us-east-2"
    encrypt = true
    dynamodb_table = "uprunning_terraform_locks"
  }


}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
    provider "aws" {
      region = "us-east-2"

      # Allow any 2.x version of the AWS provider
      version = "~> 2.0"
  }
                EOF
}
