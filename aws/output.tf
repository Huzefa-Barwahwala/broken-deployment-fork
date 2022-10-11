output "instance_id" {
  description = "The ID of the instance"
  value       = aws_instance.web.id
}

output "instance_ip" {
  description = "The IP of the instance"
  value       = aws_instance.web.public_ip
}