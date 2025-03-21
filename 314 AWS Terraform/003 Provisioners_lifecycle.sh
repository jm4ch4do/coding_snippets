# ------------------------------------ LIFE CYCLE ------------------------------------
# Alters the way terraform works with deployments
resource "aws_instance" "public_instance" {
  ami           = "ami-08b5b3a93ed654d19"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.private_subnet.id
  lifecycle {
    create_before_destroy = true  # creates new instance before destroying 
                                  # if a changes requires to create/destroy
  }
}

lifecycle {revent_destroy = true}  # if new plan requires destroy, it will return error and prevent execution
lifecycle {ignore_changes = [ami]}  # prevents any changes in the ami argument
lifecycle {replace_triggered_by = [aws_subnet.private_subnet.id]}  # forces create/destroy if subnet changes


# ----------------------------------- PROVISIONERS -----------------------------------
# Execute code when the instance is created or destroyed (like ainsible)
# provisioners are defined inside resources, same as lifecycle
resource "aws_instance" "public_instance" {
  provisioner "local-exec" { # runs command in machine running Terraform (local machine)
    command = "echo instance created with IP ${self.public_ip} >>data_instance.txt"
    when = destroy  # create is the default choice
  }

  provisioner "remote-exec" { # runs command inside the created instance using SSH
    inline = "echo hello world >> ~/greetings.txt"
  }

  connection {  # defines connection to resource so that remote provisioner can work
    type = "ssh"
    host = self.public_ip
    user = "ec2-user"
    private_key = file("my_key.pem")
  }

  "local-exec"  # runs command in machine running Terraform (local machine)
  "remote-exec"  # runs command inside the created instance using SSH
  "file"  # transfers files from local machine to remote instance using SSH

# to execute code using root user you can add the user_data argument to the resource
resource "aws_instance" "public_instance" {
  ami           = "ami-08b5b3a93ed654d19"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.private_subnet.id
  key_name = data.aws_key_pair.key.key_name
  vpc_security_group_ids = [aws_security_group.sg_public_instance.id]
  user_data = <<EOF
    !#/bin/bash
    echo "This is a message" > ~/message.txt
  EOF

# you can also do:
  user_data = file["userdata.sh"]
# place inside userdata.sh
echo "This is a message" > ~/message.txt