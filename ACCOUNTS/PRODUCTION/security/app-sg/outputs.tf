output "ec2_sg_id" {
  description = "The ID of the EC2 security group"
  value       = module.ec2_sg.ec2_sg_id
}
