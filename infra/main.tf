terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  profile = "default"
  region  = var.regiao_aws
}

resource "aws_instance" "app_server" {
  ami           = "ami-0ecc74eca1d66d8a6"
  instance_type = var.instancia
  key_name      = var.chave
  tags = {
    Name = var.instance_name
  }
}

resource "aws_key_pair" "chaveSSH" {
  key_name    = var.chave
  public_key  = file("${var.chave}.pub")
}