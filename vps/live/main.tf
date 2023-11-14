terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
    cloudinit = {
      source  = "hashicorp/cloudinit"
      version = "~> 2.3.2"
    }
  }

  required_version = ">= 1.5.0"


  # I included a remote.tfbackend if you want to maintain a remote state file.
  # backend "s3" {

  #}
}


provider "cloudinit" {

}

provider "aws" {
  region = var.region

  default_tags {
    tags = {
      Name      = "Bounty"
      Purpose   = "Bug Bounty"
      ManagedBy = "Terraform"
    }
  }
}

module "vps" {
  source = "../../modules/vps"

  instance_type = "m5ad.large"
  key_name      = "bounty"
  ami           = "ami-064e72469327cafbf"
  volume_size   = "50"
  username      = "f0nzy"
}

