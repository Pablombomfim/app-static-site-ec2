variable "vpc_sn_public_id" {}

variable "vpc_sg_pub_id" {}

variable "tipo_da_instacia" {
  default = "t3.small"
  validation {
    condition     = substr(var.tipo_da_instacia, 0, 3) == "t3."
    error_message = "Insira um tipo de instacia da geração t3"
  }
}
variable "name" {
  type    = string
  default = "Minha ec2"
}
