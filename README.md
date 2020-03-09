# Vault AppRole Terraform module

Terraform module which creates Vault AppRole

## Usage

```hcl
module "approle" {
  source = "github.com/makezbs/terraform-vault-approle.git"

  role_name   = "mySuperApp"
  policy_name = "mySuperApp"
  policy      = <<EOT
  path "secret/data/mySuperApp" {
    capabilities = ["read","list","update"]
  }
  EOT
}
```
