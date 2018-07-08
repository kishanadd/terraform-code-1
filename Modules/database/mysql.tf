resource "aws_db_subnet_group" "default" {
  name       = "${lower(var.project_name)}-dsg"
  subnet_ids = ["${var.subnet1_id}", "${var.subnet2_id}"]

  tags {
    Name = "${var.project_name}-DSG"
  }
}

resource "aws_db_instance" "default" {
  allocated_storage    = 10
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "studentapp"
  username             = "student"
  password             = "Student1"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  db_subnet_group_name = "${aws_db_subnet_group.default.id}"
  identifier           = "${lower(var.project_name)}-db"
}

