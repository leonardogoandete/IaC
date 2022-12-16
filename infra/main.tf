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
  image_id      = "ami-0ecc74eca1d66d8a6"
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

resource "aws_autoscaling_group" "grupo" {
  availability_zones = [ "${var.regiao_aws}a" ]
  name =   var.nomeGrupo
  max_size = var.maximo
  min_size = var.minimo
  launch_template {
    id = aws_launch_template.maquina.id
    version = "$Latest"
  }
}