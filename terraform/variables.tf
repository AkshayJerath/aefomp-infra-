variable "aws_region" {

  description = "AWS Region"

  default = "eu-west-2"

}

variable "eks_role_arn" {

  description = "EKS IAM Role"

  type = string

}