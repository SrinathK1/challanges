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