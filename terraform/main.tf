module "rede" {
  source   = "./modules/rede"
  vpc_cidr = "10.0.0.0/16"

}

module "compu" {
  source           = "./modules/compu"
  key_name         = "${var.key_name}"
  vpc_sn_public_id = "${module.rede.vpc_sg_pub_id}"
  vpc_sg_pub_id    = "${module.rede.vpc_sg_pub_id}"

}

#rapaz
