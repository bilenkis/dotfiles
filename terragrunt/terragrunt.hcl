generate "backend" {
  path      = "backend.generated.tf"
  if_exists = "overwrite_terragrunt"

  contents = <<EOF
terraform {
  backend "local" {
    path = "terraform.tfstate"
  }
}
EOF
}

generate "variables" {
  path      = "variables.generated.tf"
  if_exists = "overwrite_terragrunt"

  contents = <<EOF
variable "packages" {
  type = map(list(string))
}

variable "work_packages" {
  type = map(list(string))
  default = {
    tap = []
    brew = []
    cask = []
  }
}
EOF
}
