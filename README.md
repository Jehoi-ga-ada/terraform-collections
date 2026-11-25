# terraform-collections

Creates the `fronesis.id` zone in Cloudflare, and the `komodo-hooks.fronesis.id` record (Komodo webhooks; other app records are made by dockroute).

## Use

```sh
cd cloudflare
cp terraform.tfvars.example terraform.tfvars
export CLOUDFLARE_API_TOKEN=your-token
terraform init
terraform apply
```

Put your Cloudflare account ID and the server's public IP (`server_ip`) in `terraform.tfvars`. It is git-ignored, so the IP stays out of the repo.

`apply` prints the name servers. Set them at your domain registrar.

State is stored locally in `cloudflare/terraform.tfstate`. Don't delete it.
