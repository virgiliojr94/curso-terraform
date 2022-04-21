provider "aws" {
  version = "~> 3.0"
  region  = "us-west-1"
}

provider "aws" {
  alias = "us-west-2"
  version = "~> 3.0"
  region  = "us-west-2"
}

resource "aws_instance" "dev" {
  count = 3
  ami = "ami-06542a822d33e2e40"
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  tags = {
    Name = "dev${count.index}"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh-1.id}"]
}

resource "aws_instance" "dev4-1" {
  ami = "ami-06542a822d33e2e40"
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  tags = {
    Name = "dev4-1"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh-1.id}"]
  depends_on = ["aws_s3_bucket.dev4-1"]
}

resource "aws_instance" "dev5" {
  ami = "ami-06542a822d33e2e40"
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  tags = {
    Name = "dev5"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh-1.id}"]
}

resource "aws_instance" "dev6" {
  provider = "aws.us-west-2"
  ami = "ami-0b36cd6786bcfe120"
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  tags = {
    Name = "dev6"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh-us-west-2.id}"]
  depends_on = ["aws_dynamodb_table.dynamodb-homologacao"]
}

resource "aws_s3_bucket" "dev4-1" {
  bucket = "rmerceslabs-dev4-1"
  acl    = "private"

  tags = {
    Name = "rmerceslabs-dev4-1"
  }
}

resource "aws_dynamodb_table" "dynamodb-homologacao" {
  provider = "aws.us-west-2"
  name           = "GameScores"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "UserId"
  range_key      = "GameTitle"

  attribute {
    name = "UserId"
    type = "S"
  }

  attribute {
    name = "GameTitle"
    type = "S"
  }
}

