
variable "cf_account_main" {
  # expected from env vars
}

resource cloudflare_pages_project wedaman {
  account_id = var.cf_account_main
  name = "wedaman"

  production_branch = "master"
}

resource "cloudflare_pages_domain" "wedaman_com" {
  account_id   = var.cf_account_main
  name         = "wedaman.com"
  project_name = cloudflare_pages_project.wedaman.name
}

