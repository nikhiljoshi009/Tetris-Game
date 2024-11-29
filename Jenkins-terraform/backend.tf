terraform {
  backend "s3" {
    bucket = "tetrisbucket1996"    # Replace with your actual S3 bucket name
    key    = "JenkinsTerraform/terraform.tfstate"
    region = "ap-south-1"
  }
}
