resource "aws_instance" "public_instance" {
  ami           = var.ec2_specs.ami
  instance_type = var.ec2_specs.instance_type
  subnet_id = aws_subnet.private_subnet.id
  key_name = data.aws_key_pair.key.key_name
  vpc_security_group_ids = [aws_security_group.sg_public_instance.id]
  # user_data = file["userdata.sh"]


  tags = {
    Name = "Public Instance"
  }

  lifecycle {
    create_before_destroy = true
  }

  provisioner "local-exec" {
    command = "echo instance created with IP ${self.public_ip} >>data_instance.txt"
  }



  # provisioner "remote-exec" {
  #   inline = ["echo hello world >> ~/greetings.txt"]
  # }

  # connection {
  #   type = "ssh"
  #   host = self.public_ip
  #   user = "ec2-user"
  #   private_key = file("my_key.pem")
  # }
}

# resource "aws_instance" "mywebserver" {
#   ami           = "ami-08b5b3a93ed654d19"
#   instance_type = "t2.micro"
#   key_name = data.aws_key_pair.key.key_name
#   subnet_id     = aws_subnet.public_subnet.id
#   tags = {
#     "Name" = "Public Instance Direct"
#   }
#   vpc_security_group_ids = [aws_security_group.sg_public_instance.id]

# }