module "aws-prod" {
  source = "../../infra"
  instancia = "t1.micro"
  regiao_aws = "us-west-2"
  chave = "IaC-Prod"
}

output "IP" {
  description = "Endereco de IP Publico de PROD da instancia EC2"
  value       = module.aws-prod.IP_publico
}