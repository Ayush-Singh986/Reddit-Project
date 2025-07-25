# Declare the data source for the existing subnet
data "aws_subnet" "subnet" {
  filter {
    name   = "tag:Name"
    values = [var.subnet-name]  # Use exactly your existing var name
  }
}

# Declare the resource for the second subnet (public-subnet2)
resource "aws_subnet" "public-subnet2" {
  vpc_id                  = var.vpc_id  # Make sure you have this variable declared and set
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "eu-north-1a"  # Adjust as needed
  map_public_ip_on_launch = true

  tags = {
    Name = var.subnet-name2  # Use exactly your existing var name
  }
}
