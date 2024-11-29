terraform {
  backend "s3" {
    bucket = "tetris1212bucket"    # Replace with your actual S3 bucket name
    key    = "JenkinsTerraform/terraform.tfstate"
    region = "us-east-1"
  }
}
