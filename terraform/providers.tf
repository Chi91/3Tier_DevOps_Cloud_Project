terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.53.0"
    }
  }
  backend "s3" {
    bucket = "eu-central-remote-state"
    key    = "terraform.tfstate"
    region = "eu-central-1"

  }
}

provider "aws" {
  region = "eu-central-1"

}
