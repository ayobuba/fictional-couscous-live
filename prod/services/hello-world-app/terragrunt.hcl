terraform {
  source = "git@github.com:ayobuba/infrastructure-modules.git//data-stores/mysql?ref=v0.0.4"
}

include {
  path = find_in_parent_folders()
}

dependencies {
  paths = ["../../data-stores/mysql"]
}

inputs = {
  environment = "prod"

  min_size = 2
  max_size = 2

  enable_autoscaling = false

  db_remote_state_bucket = get_env("TEST_STATE_S3_BUCKET", "")
  db_remote_state_key    = "data-stores/mysql/terraform.tfstate"
}