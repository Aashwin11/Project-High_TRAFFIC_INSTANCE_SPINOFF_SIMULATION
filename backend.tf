terraform {
  backend "s3" {
    bucket         = "my-terraform-backend-123456"
    key            = "aws-auto-scale-sim/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks-proj4"
    encrypt        = true
  }
}
