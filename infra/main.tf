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

resource "aws_launch_template" "maquina" {
  image_id = "ami-0ecc74eca1d66d8a6"
  instance_type = var.instancia
  key_name      = var.chave
  tags = {
    Name = var.instance_name
  }
  security_group_names = [ var.grupoDeSeguranca ]
}

resource "aws_key_pair" "chaveSSH" {
  key_name    = var.chave
  public_key  = file("${var.chave}.pub")
}