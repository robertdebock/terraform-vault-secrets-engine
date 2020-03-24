resource "vault_mount" "this" {
  path                      = var.path
  type                      = var.type
  description               = var.description
  default_lease_ttl_seconds = var.default_lease_ttl_seconds
  max_lease_ttl_seconds     = var.max_lease_ttl_seconds
  local                     = var.local
  options                   = var.options
  seal_wrap                 = var.seal_wrap
}
