terraform {
  backend "s3" {
    bucket         = "jenkins1212bucket"
    key            = "JenkinsCICD/main"
    region         = "us-east-1"
    dynamodb_table = "jenkinscicd1212-dynamodb-table"
  }
}
