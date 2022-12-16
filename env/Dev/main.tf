module "aws-dev" {
  source = "../../infra"
  instancia = "t1.micro"
  regiao_aws = "us-west-2"
  chave = "IaC-DEV"
  grupoDeSeguranca = "DEV"
}

output "IP" {
  description = "Endereco de IP Publico de DEV da instancia EC2"
  value       = module.aws-dev.IP_publico
}