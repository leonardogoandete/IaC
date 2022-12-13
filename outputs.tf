output "instance_id" {
  description = "ID da instancia EC2"
  value       = aws_instance.app_server.id
}

output "instance_public_ip" {
  description = "Endereco de IP Publico da instancia EC2"
  value       = aws_instance.app_server.public_ip
}