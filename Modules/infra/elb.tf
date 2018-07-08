# Create a new load balancer
resource "aws_elb" "elb" {
  name               = "${var.project_name}-elb"
  // availability_zones = ["us-east-1a", "us-east-1b"]
  subnets = ["${var.subnet1_id}", "${var.subnet2_id}"]
  security_groups = ["${aws_security_group.allow_web.id}"]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "TCP:80"
    interval            = 30
  }

  instances                   = ["${aws_instance.app1.id}","${aws_instance.app2.id}"]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags {
    Name = "${var.project_name}-elb"
  }
}