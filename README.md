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

## Providers

| Name | Version |
|------|---------|
| vault | ~> 2.8 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| enable\_login | Enable login feature | `bool` | `false` | no |
| policy | Vault policy | `string` | n/a | yes |
| policy\_name | Name for Vault policy | `string` | n/a | yes |
| role\_name | Name for AppRole | `string` | n/a | yes |
| secret\_id\_num\_uses | The number of times any particular SecretID can be used to fetch a token from this AppRole, after which the SecretID will expire. A value of zero will allow unlimited uses. | `number` | `0` | no |
| secret\_id\_ttl | The number of seconds after which any SecretID expires | `number` | `0` | no |
| token\_explicit\_max\_ttl | If set, will encode an explicit max TTL onto the token in number of seconds. This is a hard cap even if token\_ttl and token\_max\_ttl would otherwise allow a renewal. | `number` | `0` | no |
| token\_max\_ttl | The maximum lifetime for generated tokens in number of seconds. Its current value will be referenced at renewal time. | `number` | `0` | no |
| token\_num\_uses | The period, if any, in number of seconds to set on the token. | `number` | `0` | no |
| token\_period | If set, indicates that the token generated using this role should never expire. The token should be renewed within the duration specified by this value. At each renewal, the token's TTL will be set to the value of this field. Specified in seconds. | `number` | `0` | no |

## Outputs

| Name | Description |
|------|-------------|
| policy\_id | The policy ID |
| role\_id | The role ID of created approle |
| secret\_id | The secret ID of created approle |
