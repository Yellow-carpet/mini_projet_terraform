resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.ebs.id
  instance_id = var.instance_id
}


resource "aws_ebs_volume" "ebs" {
  availability_zone = "us-east-1b"
  size              = var.ebs_size

  tags = {
    Name = var.ebs_tag
  }
  
}

