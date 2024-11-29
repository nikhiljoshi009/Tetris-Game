terraform {
  backend "s3" {
    bucket         = var.bucket_name
    key            = "JenkinsCICD/main"
    region         = var.aws_region
    dynamodb_table = var.dynamodb_table
  }
}
