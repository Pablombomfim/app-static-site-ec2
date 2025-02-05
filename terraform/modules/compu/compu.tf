
# EC2 INSTANCE

data "template_file" "user_data" {
    template = "${file("./scripts/user_data.sh")}"
}

resource "aws_instance" "intancia" {
    ami                    = "ami-02e136e904f3da870"
    instance_type          = "t2.micro"
    subnet_id              = "${var.vpc_sn_public_id}"
    vpc_security_group_ids = ["${var.vpc_sg_pub_id}"]
    user_data              = "${base64encode(data.template_file.user_data.rendered)}"

  tags = {
    Name = var.name
 # Insira o nome da instância de sua preferência.
  }
}

