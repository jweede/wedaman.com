
terraform {
  backend "remote" {
    organization = "jweede"
    workspaces {
      name = "wedaman_com"
    }
  }
}

provider aws {
  region = "us-east-1"
  version = "~> 2.58"
}
