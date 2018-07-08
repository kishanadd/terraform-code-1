resource "aws_instance" "app1" {
  ami           = "ami-6871a115"
  instance_type = "t2.micro"
  subnet_id = "${var.subnet1_id}"
  vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}"]

  tags {
    Name = "${var.project_name}-App1"
  }
}

resource "aws_instance" "app2" {
  ami           = "ami-6871a115"
  instance_type = "t2.micro"
  subnet_id = "${var.subnet2_id}"
  vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}"]

  tags {
    Name = "${var.project_name}-App1"
  }
}
