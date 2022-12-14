resource "aws_security_group" "acesso_geral" {
  name = "acesso_geral"
  description = "grupo de Dev"
  ingress{
    cidr_blocks = [ "0.0.0.0/0" ]
    ipv6_cidr_blocks = [ "::/0" ]
    from_port = 0 # libera todas as portas
    to_port = 0 # libera todas as portas
    protocol = "-1" # libera todos os protocolos
  }
  egress{
    cidr_blocks = [ "0.0.0.0/0" ]
    ipv6_cidr_blocks = [ "::/0" ]
    from_port = 0 # libera todas as portas
    to_port = 0 # libera todas as portas
    protocol = "-1" # libera todos os protocolos
  }
  tags = {
    Name = "acesso_geral"
  }
}