terraform {
  backend "s3" {
    bucket         = jenkins1212bucket
    key            = "JenkinsCICD/main"
    region         = var.aws_region
    dynamodb_table = var.dynamodb_table
  }
}
