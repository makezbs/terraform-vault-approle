variable "role_name" {
  type        = string
  description = "Name for AppRole"
}

variable "policy" {
  type        = string
  description = "Vault policy"
}

variable "policy_name" {
  type        = string
  description = "Name for Vault policy"
}

variable "secret_id_ttl" {
  type        = number
  default     = 0
  description = "The number of seconds after which any SecretID expires"
}

variable "token_max_ttl" {
  type        = number
  default     = 0
  description = "The maximum lifetime for generated tokens in number of seconds. Its current value will be referenced at renewal time."
}

variable "secret_id_num_uses" {
  type        = number
  default     = 0
  description = "The number of times any particular SecretID can be used to fetch a token from this AppRole, after which the SecretID will expire. A value of zero will allow unlimited uses."
}

variable "token_explicit_max_ttl" {
  type        = number
  default     = 0
  description = "If set, will encode an explicit max TTL onto the token in number of seconds. This is a hard cap even if token_ttl and token_max_ttl would otherwise allow a renewal."
}

variable "token_num_uses" {
  type        = number
  default     = 0
  description = "The period, if any, in number of seconds to set on the token."
}

variable "token_period" {
  type        = number
  default     = 0
  description = "If set, indicates that the token generated using this role should never expire. The token should be renewed within the duration specified by this value. At each renewal, the token's TTL will be set to the value of this field. Specified in seconds."
}
