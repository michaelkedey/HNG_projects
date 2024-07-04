variable "instance_type" {
  type = map(string)
  default = {
    project    = "t2.micro",
    production = "m5.large"
  }
  description = "instance type for project server"
}

variable "names" {
  default = {
    instance_name = "hng_server"
  }
  type = map(string)
}

variable "key_name" {
  default = "ginakey"
  type    = string
}

variable "tags_all" {
  type        = map(string)
  description = "A map of tags to assign to the resource."
  sensitive   = true
  default = {
    "Environment" = "hng",
    "Owner"       = "Michael Kedey"
  }
}

variable "enable" {
  default = true
  type    = bool
}

variable "subnet" {

}

variable "sg" {

}