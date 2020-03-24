# Vault Secrets Engine Terraform module

Terraform module which creates [Vault Secrets Engine](https://www.vaultproject.io/docs/secrets/)

## Usage

```hcl
module "secrets_engine" {
  source = "github.com/makezbs/terraform-vault-secrets-engine.git"

  path = "secret"
  type = "kv"
  options = {
    version = 2
  }
}
```

## Import current secrets_engine

```sh
terraform import module.secrets_engine.vault_mount.this secretName
terraform show
# Copy your variables in current module
terraform plan -out tfplan

  ~ resource "vault_mount" "this" {
        accessor                  = "kv_493c7v22"
        default_lease_ttl_seconds = 0
        id                        = "secretName"
        local                     = false
        max_lease_ttl_seconds     = 0
      ~ options                   = {
          ~ "version" = "1" -> "2"
        }
      ~ path                      = "secretName" -> "secret"
        seal_wrap                 = false
        type                      = "kv"
    }

terraform apply tfplan
```

## Providers

| Name | Version |
|------|---------|
| vault | ~> 2.8 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| default\_lease\_ttl\_seconds | Default lease duration for tokens and secrets in seconds | `number` | `0` | no |
| description | Human-friendly description of the mount | `string` | n/a | yes |
| local | Boolean flag that can be explicitly set to true to enforce local mount in HA environment | `bool` | `false` | no |
| max\_lease\_ttl\_seconds | Maximum possible lease duration for tokens and secrets in seconds | `number` | `0` | no |
| options | Specifies mount type specific options that are passed to the backend | `map` | `{}` | no |
| path | (Required) Where the secret backend will be mounted | `string` | n/a | yes |
| seal\_wrap | Boolean flag that can be explicitly set to true to enable seal wrapping for the mount, causing values stored by the mount to be wrapped by the seal's encryption capability | `bool` | `false` | no |
| type | (Required) Type of the backend, such as 'aws' | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| path | Where the secret backend mounted |
