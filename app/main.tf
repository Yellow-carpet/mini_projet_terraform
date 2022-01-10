module "sofiane-app-ec2" {
  source = "../modules/ec2"
  instancetype = "t2.micro"
  sg_id = module.sofiane-app-sg.sg_id
}

module "sofiane-app-ebs" {
  source = "../modules/ebs"
  ebs_size = 4
  ebs_tag = "sofiane-ebs"
  instance_id = module.sofiane-app-ec2.ec2_id
}

module "sofiane-app-eip" {
  source = "../modules/eip"
  instance_id = module.sofiane-app-ec2.ec2_id
}

module "sofiane-app-sg" {
  source = "../modules/sg"
  sg_name = "sofiane_sg_project"
}

provider "aws" {
  region     = "us-east-1"
  shared_credentials_file = "C:\\Users\\sotet\\Desktop\\formation\\terra\\tp_test_terraform\\TP10\\.aws\\config\\credentials"
}