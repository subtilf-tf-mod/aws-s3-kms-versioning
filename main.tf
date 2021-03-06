###### Doc reference: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket#lifecycle_rule ####

resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
  acl    = var.acl
  #Grant not declared
  #Policy not declared
  tags          = var.tags
  force_destroy = var.force_destroy
  #Website not declared
  #cors_rule not declared
  #versioning not declared
  #prefix not declared
  #acceleration_status not declared
  #request_payer not declared
  #replication_configuration not declared
  versioning {
    enabled = var.default_versioning
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = var.rc_kms_key
        sse_algorithm     = "aws:kms"
      }
    }
  }
  #object_lock_configuration not declared 
}