module "rede" {
  source   = "./modules/rede"
  vpc_cidr = var.vpc_cidr
 
}

module "compu" {
  source        = "./modules/compu"
  key_name      = var.key_name
  vpc_sn_public_id = "${module.rede.vpc_sn_public_id}"
  vpc_sg_pub_id = "${module.rede.vpc_sg_pub_id}"
  
}

#rapaz
