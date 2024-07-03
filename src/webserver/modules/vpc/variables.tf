variable "vpc_cidr" {
  type    = string
  default = "177.70.0.0/24"
}

variable "subnet_cidr" {
  type    = string
  default = "177.70.0.0/26"
}

variable "vpc_name" {
  default = "hng vpc"
}

variable "subnet_name" {
  default = "hng_subnet"
}

variable "azs" {
  default   = ["us-east-1a", "us-east-1b"]
  type      = list(string)
  sensitive = true
}

variable "default_cidr" {
  default = "0.0.0.0/0"
}

variable "igw_name" {
  default = "hng_igw"
}