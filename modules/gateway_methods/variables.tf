variable "resources" {
  description = "List contains "
  type        = list(object({
    resource_id   = string
    gatewayapi = string

  }))
}