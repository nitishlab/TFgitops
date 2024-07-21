variable "var_ami" {
  type = string
}
variable "instancetype" {
  type = string
  default = "t3.micro"
}

variable "var_aws_iam_user" {
        type= string
}
variable "var_aws_elb" {
        type=string
}
variable "var_az" {
        type=list(string)
}
variable "var_idle_time_out" {
        type=number
  default = 60
}
variable "var_connection_draining_timeout" {
        type=number
  default = 300
}

variable "create_iam_user" {
  type    = bool
  default = false
}

variable "create_elb" {
  type    = bool
  default = false
}
