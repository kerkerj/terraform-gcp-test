variable "credentials_path" { default = "terraform-test-226203-d33960a7c97b.json" } # download from service account
variable "project_id" { default = "terraform-test-226203" }
variable "region" { default = "asia-east1" }
variable "state_bucket" { default = "terraform" }
variable "ssh_keys" { default = "kerkerj:${file($TF_VAR_ssh_key_path)}" }
