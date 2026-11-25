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

variable "server_ip" {
  type        = string
  description = "domainesia-devops public IPv4"
}

resource "cloudflare_dns_record" "komodo_hooks" {
  zone_id = cloudflare_zone.this.id
  name    = "komodo-hooks.fronesis.id"
  type    = "A"
  content = var.server_ip
  proxied = true
  ttl     = 1
}
