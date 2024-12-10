provider "aws" {
  region                      = "us-east-1"
  access_key                  = "test" # LocalStack default
  secret_key                  = "test" # LocalStack default
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true # Avoid STS calls to check the account ID

  endpoints {
    s3  = "http://localhost:4566" # LocalStack S3 endpoint
    sts = "http://localhost:4566" # LocalStack STS endpoint
  }
}



resource "aws_s3_bucket" "buckets" {
  for_each = toset(["bucket1", "bucket2", "bucket3"])

  bucket = each.key

  lifecycle {
    create_before_destroy = true
  }

  timeouts {
    create = "1m"
    delete = "1m"
  }
}
