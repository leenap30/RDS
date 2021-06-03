resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = [aws_subnet.private_1.id, aws_subnet.private_2.id]

  tags = {
    Name = "My DB subnet group"
  }
}

resource "aws_db_instance" "default" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "TCSdemo"
  username             = "admin"
  password             = "adminmaster"
  db_subnet_group_name=aws_db_subnet_group.default.name
  vpc_security_group_ids=[aws_security_group.db.id]
  
  tags = {
    Name = "My db instance"
  }
}

output "end_point" {
  value = aws_db_instance.default.endpoint
}
