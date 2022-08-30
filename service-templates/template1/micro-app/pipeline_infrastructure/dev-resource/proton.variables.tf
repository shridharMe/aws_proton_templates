variable "environment" {
  type = object({
    outputs = map(string)
  })
  default = null
}


variable "service" {
  type = object({
    name   = string
    inputs = map(string)
  })
  default = null
}
