resource "aws_instance" "web" {
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = var.key_name
  monitoring                  = var.monitoring
  vpc_security_group_ids      = ["${aws_security_group.sg.id}"]
  subnet_id                   = aws_subnet.private_subnet.id
  private_ip                  = var.private_ip
  associate_public_ip_address = var.associate_public_ip_address_app
  tags = {
    Name = var.tags_app
  }
  #user_data = "path"
}
