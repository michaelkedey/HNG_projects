#ami
data "aws_ami" "latest_ubuntu" {
  most_recent = true
  provider    = aws.region

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical's AWS account ID

}

resource "aws_instance" "instance" {
  instance_type               = "${var.instance_type}" ["project"]
  ami                         = data.aws_ami.latest_ubuntu.id
  user_data                   = file("${path.module}/nginx.sh")
  associate_public_ip_address = var.enable
  subnet_id                   = var.subnet
  provider                    = aws.region
  security_groups             = var.sg
  #key exists already in my cloud environment
  #key_name = var.key_name
  tags = sensitive(
    merge(
      var.tags_all,
      {
        Name = var.names["instance_name"]
      }
    )
  )

}


output "public_ip_address" {
  value = aws_instance.instance.public_ip
}
