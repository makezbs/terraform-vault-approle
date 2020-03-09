output "role_id" {
  value = vault_approle_auth_backend_role.this.role_id
}

output "secret_id" {
  value = vault_approle_auth_backend_role_secret_id.this.secret_id
}
