terraform {
  required_version = ">= 1.5.1"
  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "3.2.1"
    }
  }
}

resource "null_resource" "mkdir" {
  provisioner "local-exec" {
    command = "mkdir -p ~/Screenshots"
  }
}
