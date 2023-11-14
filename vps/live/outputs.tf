output "vps_public_ip" {
  value       = module.vps.vps_public_ip
  description = "The IP of the VPS"
}


output "id" {
  description = "ID of instance"
  value       = module.vps.id
}
