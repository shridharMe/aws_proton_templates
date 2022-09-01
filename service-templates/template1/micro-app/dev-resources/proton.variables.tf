
variable "service_instance" {
  type = object({
    name   = string
    inputs = map(string)
  })
  default = null
}

variable "environment" {
  type = object({
    outputs = map(string)
  })
  default = null
}
