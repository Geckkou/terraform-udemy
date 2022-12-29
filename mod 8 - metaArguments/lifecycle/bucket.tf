resource "aws_s3_bucket" "this" {
  bucket = "lifecycle-terraform-bucket"

  /*lifecycle {
    prevent_destroy = true 
  }*/
}