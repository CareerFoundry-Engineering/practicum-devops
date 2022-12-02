data "aws_key_pair" "instance_key" {
  key_name           = "${var.deployment_account}-exp-infra-kp"
  include_public_key = true
}

resource "aws_instance" "ec2_instance" {
  ami                    = "ami-05fa00d4c63e32376"
  instance_type          = "t2.micro"
  user_data              = var.user_data
  subnet_id              = var.instance_subnet_id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  key_name               = data.aws_key_pair.instance_key.key_name
  tags = {
    Name = "${var.env}-${var.name_prefix}-instance"
  }
}

resource "aws_security_group" "ec2_sg" {
  name        = "${var.env}-${var.name_prefix}-instance-sg"
  description = "Security group created for ${var.env} ${var.name_prefix} instance"
  vpc_id      = var.vpc_id
}
