terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0.4"
    }
    time = {
      version = "~> 0.9"
    }
  }
}


provider "aws" {
  region = var.terr_region
}
