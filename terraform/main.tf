module "rede" {
    source = "./modules/rede"
    vpc_cidr = "${var.vpc_cidr}"
}

module "compu" {
    source = "./modules/compu"
    key_name = "${var.key_name}"
}