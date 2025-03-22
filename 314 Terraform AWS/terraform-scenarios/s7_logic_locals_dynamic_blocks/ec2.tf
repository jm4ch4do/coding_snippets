resource "aws_instance" "public_instance" {
  for_each      = var.instances
  ami           = var.ec2_specs.ami
  instance_type = var.ec2_specs.instance_type
  subnet_id = aws_subnet.private_subnet.id
  key_name = data.aws_key_pair.key.key_name
  vpc_security_group_ids = [aws_security_group.sg_public_instance.id]

  tags = {
    "Name" = each.value
  }
  user_data = file("userdata.sh")
}


resource "aws_instance" "public_instance_monitoring" {
  count = var.enable_monitoring ? 1:0
  ami           = var.ec2_specs.ami
  instance_type = var.ec2_specs.instance_type
  subnet_id = aws_subnet.private_subnet.id
  key_name = data.aws_key_pair.key.key_name
  vpc_security_group_ids = [aws_security_group.sg_public_instance.id]

  tags = {
    "Name" = "Monitoring"
  }
}