terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.53.0"
    }
  }

  #   backend "s3" {
  #     bucket = "eu-west-remote-state"
  #     key    = "terraform.tfstate"
  #     region = "eu-west-2"
  #   }
}

provider "aws" {
  region = "eu-west-2"

}
