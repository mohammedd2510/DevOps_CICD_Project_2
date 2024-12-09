
resource "aws_instance" "Sonarqube_Ec2" {
  ami           =  data.aws_ami.ubuntu.id
  instance_type = var.Ec2_Instance_Type  # Change to your desired instance type
  subnet_id     = var.Public_Subnet1_id
  associate_public_ip_address = true  # Enable public IP

  vpc_security_group_ids = [var.Public_Security_Group_id]

  tags = {
    Name = "Sonarqube_instance"
  }
  key_name = "key"
  user_data = file("${path.module}/Sonarqube_Script.sh")

  
}
output "EC2_Sonarqube_id" {
  value = aws_instance.Sonarqube_Ec2.id
}
output "Sonarqube_public_ip" {
    value = aws_instance.Sonarqube_Ec2.public_ip
  
}
output "Sonarqube_private_ip" {
    value = aws_instance.Sonarqube_Ec2.private_ip
  
}