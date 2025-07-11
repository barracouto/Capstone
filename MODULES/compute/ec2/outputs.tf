output "instance_id" {
  value = aws_instance.this.id
}

output "private_ip" {
  value = aws_instance.this.private_ip
}

output "instance_name" {
  value = aws_instance.this.tags["Name"]
}
