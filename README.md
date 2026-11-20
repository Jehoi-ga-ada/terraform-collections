# terraform-collections

Creates the `fronesis.id` zone in Cloudflare.

## Use

```sh
cd cloudflare
cp terraform.tfvars.example terraform.tfvars
export CLOUDFLARE_API_TOKEN=your-token
terraform init
terraform apply
```

Put your Cloudflare account ID in `terraform.tfvars`.

`apply` prints the name servers. Set them at your domain registrar.

State is stored locally in `cloudflare/terraform.tfstate`. Don't delete it.
