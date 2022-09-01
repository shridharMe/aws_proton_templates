variable "environment" {
  type = object({
   name   = string
    inputs = map(string)
  })
  default = null
}
