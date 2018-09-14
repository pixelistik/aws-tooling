resource "aws_vpc" "example" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
}

resource "aws_internet_gateway" "default" {
  vpc_id = "${aws_vpc.example.id}"
}

resource "aws_route_table" "eu-west-1-public" {
  vpc_id = "${aws_vpc.example.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.default.id}"
  }

  tags {
    Name = "Public Subnet"
  }
}

resource "aws_route_table_association" "eu-west-1a-public" {
  subnet_id      = "${aws_subnet.eu-west-1a-public.id}"
  route_table_id = "${aws_route_table.eu-west-1-public.id}"
}

resource "aws_subnet" "eu-west-1a-public" {
  vpc_id            = "${aws_vpc.example.id}"
  cidr_block        = "10.0.1.0/24"
  availability_zone = "eu-west-1a"
}

resource "aws_security_group" "rvg_test" {
  name        = "rvg_test"
  description = "default VPC security group"
  vpc_id      = "${aws_vpc.example.id}"
  
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["10.0.0.0/16"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
