variable "instance_name" {
  description = "Valor da tag Name para a instância do EC2"
  type        = string
  default     = "Terraform Ansible Python"
}

variable "regiao_aws" {
  type  = string
}

variable "chave" {
  type = string
}

variable "instancia" {
  type = string
}

variable "grupoDeSeguranca" {
  type = string  
}