# Define the AWS provider
provider "aws" {
  region = "us-east-2"  # region
}

# Create an S3 bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = "safia-bucket-123"  # bucket name
}
