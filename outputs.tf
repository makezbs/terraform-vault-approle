output "role_id" {
  description = "The role ID of created approle"
  value       = vault_approle_auth_backend_role.this.role_id
}

output "secret_id" {
  description = "The secret ID of created approle"
  value       = vault_approle_auth_backend_role_secret_id.this.secret_id
}

output "policy_id" {
  description = "The policy ID"
  value       = vault_policy.this.id
}
