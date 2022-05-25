variable "environment" {
  type = object({
    outputs = map(string)
  })
  default = null
}