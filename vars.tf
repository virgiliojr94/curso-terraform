variable "amis" {
    type = map(string)

  default = {
      "us-west-1" = "ami-06542a822d33e2e40"
      "us-west-2" = "ami-0b36cd6786bcfe120"
  }
}

variable "cdirs_acesso_remoto" {
  type = list(string)
  default = ["45.232.38.181/32"]
}

variable "key_name" {
  default = "terraform-aws"
}