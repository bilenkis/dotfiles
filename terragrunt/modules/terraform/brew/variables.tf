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
