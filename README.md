# Terraform quick play

Follow this tutorial: https://cloud.google.com/community/tutorials/getting-started-on-gcp-with-terraform

prepare:

* local ssh key
* gcp service account key (download json format)
* gcr go-web image (built from dockerfiles/)

usage:

```
$ TF_VAR_ssh_key_path=~/.ssh/xxxx terraform init
$ TF_VAR_ssh_key_path=~/.ssh/xxxx terraform plan
$ TF_VAR_ssh_key_path=~/.ssh/xxxx terraform apply
```

You can store the variables by envchain.
