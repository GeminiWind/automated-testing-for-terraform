module "ec2" {
  source        = "../../"
  aws_region    = "ap-southeast-2"
  image_id      = "ami-02a599eb01e3b3c5b"
  instance_type = "t2.micro"
  
}