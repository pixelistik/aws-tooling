resource "aws_instance" "host-1a" {
  ami                         = "ami-1b791862"
  instance_type               = "t2.nano"
  subnet_id                   = "${aws_subnet.eu-west-1a-public.id}"
  associate_public_ip_address = true
  key_name                    = "deployer-key"
  security_groups             = ["${aws_security_group.rvg_test.id}"]

  tags {
    Name            = "EBS Resize Tests"
  }
}