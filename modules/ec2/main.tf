resource "aws_instance" "sofiane_ec2" {
  ami           = data.aws_ami.image.id
  instance_type = var.instancetype
  key_name      = "sofiane_kp2"
  tags = {
    Name = var.tag_info.Name
    iac  = var.tag_info.iac
  }

  vpc_security_group_ids = [var.sg_id]

  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt install nginx -y",
      "sudo systemctl enable nginx",
      "sudo systemctl start nginx"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("./sofiane_kp2.pem")
      host        = self.public_ip
    }
  }
}

data "aws_ami" "image" {
  most_recent = true
  owners      = ["aws-marketplace"]

  filter {
    name   = "name"
    values = ["*ubuntu-bionic*"]
  }
}

resource "local_file" "file2" {
  filename = "./info_ec2.txt"
  content  = "Voici l'ip : ${aws_instance.sofiane_ec2.public_ip} et l'id : ${aws_instance.sofiane_ec2.id} et enfin la region : ${aws_instance.sofiane_ec2.availability_zone}"
}


