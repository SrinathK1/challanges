variable "ami" {
    type = string
}
variable "instance_type" {
    type = string 
}
variable "key_name" {
    type = string
}
variable "monitoring" {
    type = bool
}
variable "associate_public_ip_address" {
    type = bool
}
variable "tags" {
    type = string
}
variable "associate_public_ip_address_app" {
    type = bool
}
variable "private_ip" {
    type = string
}
variable "tags_app" {
    type = string
}
variable "igw_name" {
    type = string
}
variable "destination_cidr_block" {
    type = string
}
variable "priv1_availability_zone" {
    type = string
}
variable "priv1_tag_subnet" {
    type = string
}
variable "priv1_cidr_block" {
    type = string
  
}
variable "priv1_rt" {
    type = string
}
variable "priv2_tag_subnet" {
    type = string
}
variable "priv2_cidr_block" {
    type = string
}
variable "priv2_rt" {
    type = string
}
variable "priv2_availability_zone" {
    type = string
}
variable "pub_cidr_block" {
    type = string
}
variable "map_public_ip_on_launch" {
    type = string
}
variable "pub_availability_zone" {
    type = string
}
variable "pub_tag_subnet" {
    type = string
}
variable "pub_rt" {
    type = string  
}
variable "cidr_block" {
    type = string  
}
variable "enable_dns_support" {
    type = string
}
variable "enable_dns_hostnames"{
    type = string
}
variable "vpc_name" {
    type = string 
}