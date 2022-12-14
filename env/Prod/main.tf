module "aws-prod" {
  source = "../../infra"
  instancia = "t1.micro"
  regiao_aws = "us-west-2"
  chave = "IaC-Prod"
}