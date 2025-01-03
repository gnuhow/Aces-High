resource "aws_kms_key" "ebs" {
  description             = "EBS KMS key"
  enable_key_rotation     = true
  deletion_window_in_days = 20
  policy = jsonencode({
    Version = "2012-10-17"
    Id      = "tf-ebs-1"
    Statement = [
      {
        Sid    = "Enable IAM User Permissions"
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
        },
        Action   = "kms:*"
        Resource = "*"
      },
      {
        Sid    = "Allow administration of the key"
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/*"
        },
        Action = [
          "kms:ReplicateKey",
          "kms:Create*",
          "kms:Describe*",
          "kms:Enable*",
          "kms:List*",
          "kms:Put*",
          "kms:Update*",
          "kms:Revoke*",
          "kms:Disable*",
          "kms:Get*",          
          "kms:Delete*",
          "kms:ScheduleKeyDeletion",
          "kms:CancelKeyDeletion"
        ],
        Resource = "*"
      },
      # {
      #   Sid    = "Allow use of the key"
      #   Effect = "Allow"
      #   Principal = "*"
      #   Action = [
      #     "kms:DescribeKey",
      #     "kms:Encrypt",
      #     "kms:Decrypt",
      #     "kms:ReEncrypt*",
      #     "kms:GenerateDataKey",
      #     "kms:GenerateDataKeyWithoutPlaintext"
      #   ],
      #   Resource = "*"
      #   Condition = {
      #     StringEquals = {
      #       "kms:CallerAccount": "${data.aws_caller_identity.current.account_id}",
      #       "kms:ViaService": "ec2.us-east-1.amazonaws.com"
      #     }
      #   }
      # }
    ]
  })
}