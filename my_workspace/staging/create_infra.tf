provider "aws" {
  region = "eu-north-1"
}

module "ec2_instance" {
  source = "../../modules"
  var_ami = "ami-07c8c1b18ca66bb07"
  instancetype = "t3.micro"
  create_iam_user = false
  create_elb = false
  var_aws_iam_user = "dummy_value"
  var_aws_elb = "dummy_value"
  var_az = ["dummy_value"]
  var_idle_time_out = 60
  var_connection_draining_timeout = 300
  name = "staging-ec2"
}

##
##
##
##
##
## 
##
##git push
##
##
##