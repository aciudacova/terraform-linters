output "instance_id" {
  description = "ID of the EC2 instance"
  value       = module.ec2-instance.instance_id
}

output "instance_ip" {
  description = "Public IP address of the EC2 instance"
  value       = module.ec2-instance.instance_public_ip
}
