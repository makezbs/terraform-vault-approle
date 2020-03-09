data "vault_auth_backend" "this" {
  path = "approle"
}

resource "vault_policy" "this" {
  name   = var.policy_name
  policy = var.policy
}

resource "vault_approle_auth_backend_role" "this" {
  backend        = data.vault_auth_backend.this.path
  role_name      = var.role_name
  token_policies = [vault_policy.this.id]

  secret_id_ttl          = 0
  token_max_ttl          = 0
  secret_id_num_uses     = 0
  token_explicit_max_ttl = 0
  token_num_uses         = 0
  token_period           = 0
}

resource "vault_approle_auth_backend_role_secret_id" "this" {
  backend   = data.vault_auth_backend.this.path
  role_name = vault_approle_auth_backend_role.this.role_name
}

resource "vault_approle_auth_backend_login" "this" {
  backend   = data.vault_auth_backend.this.path
  role_id   = vault_approle_auth_backend_role.this.role_id
  secret_id = vault_approle_auth_backend_role_secret_id.this.secret_id
}
