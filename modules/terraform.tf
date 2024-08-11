provider "aws" {
  region     = "eu-north-1"
}

resource "aws_instance" "myec2" {
   ami = var.var_ami
   instance_type = var.instancetype
   tags = {
    Name = var.instance_name
  }
}


resource "aws_iam_user" "lb" {
  count = var.create_iam_user ? 1 : 0
  name = var.var_aws_iam_user
  path = "/system/"
}


# Create a new load balancer
resource "aws_elb" "bar" {
  count              = var.create_elb ? 1 : 0
  name               = var.var_aws_elb
  availability_zones = var.var_az

  listener {
    instance_port     = 8000
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:8000/"
    interval            = 30
  }

  cross_zone_load_balancing   = true
  idle_timeout                = var.var_idle_time_out
  connection_draining         = true
  connection_draining_timeout = var.var_connection_draining_timeout

  tags = {
    Name = "foobar-terraform-elb"
  }
}


output "public_ip"{
        value=aws_instance.myec2.public_ip
}

output "elb_name" {
  value = var.create_elb ? aws_elb.bar[0].name : null
}
