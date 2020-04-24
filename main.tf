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

  secret_id_ttl          = var.secret_id_ttl
  token_max_ttl          = var.token_max_ttl
  secret_id_num_uses     = var.secret_id_num_uses
  token_explicit_max_ttl = var.token_explicit_max_ttl
  token_num_uses         = var.token_num_uses
  token_period           = var.token_period
}

resource "vault_approle_auth_backend_role_secret_id" "this" {
  count = var.create_secret_id ? 1 : 0

  backend   = data.vault_auth_backend.this.path
  role_name = vault_approle_auth_backend_role.this.role_name
}

resource "vault_approle_auth_backend_login" "this" {
  count = var.enable_login && var.create_secret_id ? 1 : 0

  backend   = data.vault_auth_backend.this.path
  role_id   = vault_approle_auth_backend_role.this.role_id
  secret_id = vault_approle_auth_backend_role_secret_id.this.*.secret_id[count.index]
}
