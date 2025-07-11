output "alb_sg_id" {
  description = "The ID of the ALB security group"
  value       = module.alb_sg.alb_sg_id
}
