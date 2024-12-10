provider "aws" {
  region                      = "us-east-1"
  access_key                  = "test"
  secret_key                  = "test"
  skip_credentials_validation = true
  skip_metadata_api_check     = true

  endpoints {
    s3 = "http://localhost:4566"
    sts = "http://localhost:4566"
  }

  default_tags {
    tags = {
      Environment = "Local"
    }
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
