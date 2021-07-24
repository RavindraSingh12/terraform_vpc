data "aws_availability_zones" "available" {
  state = "available"
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.2.0"
  name    = "${var.aws_account_name}-${var.vpc_env}"
  cidr    = var.vpc_cidr

  azs = [data.aws_availability_zones.available.names[0], data.aws_availability_zones.available.names[1]]

  public_subnets  = [cidrsubnet(var.vpc_cidr, 8, 0), cidrsubnet(var.vpc_cidr, 8, 1)]
  private_subnets = [cidrsubnet(var.vpc_cidr, 8, 2), cidrsubnet(var.vpc_cidr, 8, 3)]

  #This will create will only create one public subnet and route all private subnets via this NATGW
  enable_nat_gateway     = true
  single_nat_gateway     = var.vpc_env=="lower"?true:false
  one_nat_gateway_per_az = var.vpc_env=="lower"?false:true

  enable_dns_hostnames = true
  enable_dns_support   = true

  #Create flow logs for entire vpc 
  flow_log_cloudwatch_log_group_name_prefix = "/aws/vpc-flow-log/${var.vpc_env}/"
  enable_flow_log                           = false
  create_flow_log_cloudwatch_iam_role       = false
  create_flow_log_cloudwatch_log_group      = false


  tags = {
    Terraform   = true
    Environment = upper(var.vpc_env)
    Project     = upper(var.aws_account_name)
    Owner       = "ravindrasinghkhichi13@gmail.com"
    Phone       = "P: 9515119031 || W: 7977517750"
  }

}
