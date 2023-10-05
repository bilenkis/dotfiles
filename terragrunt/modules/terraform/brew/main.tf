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

resource "installer_brew" "packages" {
  for_each = toset(var.packages.brew)
  name     = each.key
}

resource "installer_brew" "work_packages" {
  for_each = toset(var.work_packages.brew)
  name     = each.key
}

resource "installer_brew" "cask" {
  for_each = toset(var.packages.cask)
  name     = each.key
  cask     = true
}

resource "installer_brew" "work_cask" {
  for_each = toset(var.work_packages.cask)
  name     = each.key
  cask     = true
}

# data "external" "brew_prefix" {
#   program = ["bash", "-c", "'brew --prefix'"]
# }

# output "brew_prefix" {
#   value = data.external.brew_prefix.result
# }
