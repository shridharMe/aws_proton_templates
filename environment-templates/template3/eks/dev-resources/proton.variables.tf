variable "environment" {
  type = object({
   name   = string
    inputs = map(string)
    outputs = map(string)
  })
  default = null
}
