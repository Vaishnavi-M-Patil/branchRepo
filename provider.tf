terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.0.0-beta1"
    }
  }
}

provider "aws" {
  # Configuration options
  region = var.region
}

#create variable block for region
variable "region" {
  default = "us-east-1"
}