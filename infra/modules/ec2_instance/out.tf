output "sg_id" {
  value       = aws_security_group.ec2_sg.id
  description = "Security group ID of instance"
}

output "instance_id" {
  value       = aws_instance.ec2_instance.id
  description = "ID of the EC2 instance"
}

output "public_ip" {
  value       = aws_instance.ec2_instance.public_ip
  description = "IP address"
}
