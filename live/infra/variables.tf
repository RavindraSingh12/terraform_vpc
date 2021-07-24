#vpc var
variable "region" {
  description = "the AWS region in which resources are created, you must set the availability_zones variable as well if you define this value to something other than the default"
  default     = "us-west-2"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  default     = "10.0.0.0/16"
}

variable "vpc_env" {
  description = "the name of your environment, e.g. \"prod\""
  default     = "lower"
}

variable "aws_account_name" {
  description = "aws account name, org, or client name"
  default     = "bigbasket"
}
