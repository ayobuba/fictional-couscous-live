terraform {
  source = "git@github.com:ayobuba/infrastructure-modules.git//data-stores/mysql?ref=v0.0.4"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  db_name     = "example_stage"
  db_username = "admin"

  # Set the password using the TF_VAR_db_password environment variable
}
