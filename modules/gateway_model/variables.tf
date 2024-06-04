variable "api_id" {
  type    = string
}

variable "models" {
  type = list(object({
    name         = string
    description  = string
    content_type = string
    schema       = string
  }))
}

