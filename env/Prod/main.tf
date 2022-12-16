module "aws-prod" {
  source = "../../infra"
  instancia = "t2.micro"
  regiao_aws = "us-west-2"
  chave = "IaC-Prod"
  grupoDeSeguranca =  "Producao"
}

output "IP" {
  description = "Endereco de IP Publico de PROD da instancia EC2"
  value       = module.aws-prod.IP_publico
}