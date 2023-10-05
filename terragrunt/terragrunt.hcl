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

generate "terraform" {
  path      = "terraform.generated.tf"
  if_exists = "overwrite_terragrunt"

  contents = <<EOF
terraform {
  required_version = ">= 1.5.1"
  required_providers {
    installer = {
      source  = "shihanng/installer"
      version = "0.6.1"
    }
    external = {
      source  = "hashicorp/external"
      version = "2.3.1"
    }
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

generate "packages" {
  path      = "packages.generated.tf"
  if_exists = "overwrite_terragrunt"

  contents = <<EOF
module "packages" {
  source = "../modules/terraform/brew"
  packages = var.packages
  work_packages = var.work_packages
}
EOF
}

generate "os" {
  path      = "os.generated.tf"
  if_exists = "overwrite_terragrunt"

  contents = <<EOF
module "packages" {
  source = "../modules/terraform/os"
}
EOF
}
