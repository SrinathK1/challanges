resource "aws_instance" "nginx" {
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = var.key_name
  monitoring                  = var.monitoring
  vpc_security_group_ids      = ["${aws_security_group.sg.id}"]
  subnet_id                   = aws_subnet.public_subnet.id
  associate_public_ip_address = var.associate_public_ip_address
  tags = {
    Name = var.tags
  }
  #user_data = "path"
}
