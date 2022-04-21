variable "amis" {
    type = map(string)

  default = {
      "us-west-1" = "ami-026c8acd92718196b"
      "us-west-2" = "ami-0d8f6eb4f641ef691"
  }
}

variable "cdirs_acesso_remoto" {
  type = list(string)
  default = ["45.232.38.181/32"]
}

variable "key_name" {
  default = "terraform-aws"
}

