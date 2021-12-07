terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" {
    ami = "ami-0ed9277fb7eb570c9"
  instance_type = "t2.micro"
}

# Create a VPC
resource "aws_vpc" "my-vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_budgets_budget" "Auto-scaling-Queen" {
  name		    = "monthl-budget"
  budget_type       = "COST"
  limit_amount      = "500.0"
  limit_unit 	    = "USD"
  time_unit         = "MONTHLY"
  time_period_start = "2021-12-01_00:01"

}


