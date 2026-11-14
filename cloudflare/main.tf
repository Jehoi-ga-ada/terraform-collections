terraform {
  required_version = ">= 1.6"
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5.0"
    }
  }
}

provider "cloudflare" {}

variable "account_id" {
  type        = string
  description = "Cloudflare account ID (dashboard > any domain > right sidebar, or Account Home URL)"
}

variable "zone_name" {
  type    = string
  default = "fronesis.id"
}

resource "cloudflare_zone" "this" {
  account = { id = var.account_id }
  name    = var.zone_name
  type    = "full"
}

output "name_servers" {
  value = cloudflare_zone.this.name_servers
}
