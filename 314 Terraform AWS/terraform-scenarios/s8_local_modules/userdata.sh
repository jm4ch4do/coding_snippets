echo "This is a message" > ~/message.txt
yum update -y
yum install httpd -y
systemctl enable httpd
systemctl start httpd

