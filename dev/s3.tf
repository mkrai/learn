provider "aws" {
  region = "us-east-2"
}

resource "aws_s3_bucket" "tfstatebuckmkr" {
  bucket = "tfstatebuckmkr"
  # Prevent accidental deletion of this S3 bucket
  lifecycle {
    prevent_destroy = false
  }
 
}
resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.tfstatebuckmkr.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
  bucket = aws_s3_bucket.tfstatebuckmkr.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

#Next, create an S3 bucket by using the aws_s3_bucket resource:


output "bucket" {
  value = aws_s3_bucket.tfstatebuckmkr
}
