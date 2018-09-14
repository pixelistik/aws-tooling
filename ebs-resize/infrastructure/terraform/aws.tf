provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "eu-west-1"
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA66dQdWXDGBXtOV5+4wrd8tn070hig/rIkwAd6OFNPDgV3/Qj7rhndSuEn/bvf+YFPzQU6J4V8hl0SUed5h8NFuWB8UFX1ZTGkbuC6nnM+6IPhKwD41+iokli7vJF4Tw/9hhKIGdVnLPe0/0yVZf2RbgMeRDwxjEOorUNIfcK7AiEPljkxdYeb/C/laQfncP5fM7EQJu59MmcizG5cEsAsbnwqI3NTKngiZ+OqJ/SnM7vEvxNOTjb1PMw7DyXaBTnef+SLevoWcKqx1PRKLTqA9cJIIaajpZUaWwcoN6IdRWfuUfFEOuZtm0EtbYFmfy/OGL4FeNKldPnkaZ1lzRs8w== code@pixelistik.de"
}
