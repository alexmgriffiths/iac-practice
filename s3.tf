resource "aws_s3_bucket" "app" {
  bucket = "app"
  tags = {
    Name        = "App Bucket"
  }
}

resource "aws_s3_bucket" "public" {
  bucket = "public"
  tags = {
    Name        = "Public bucket"
  }
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.public.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}