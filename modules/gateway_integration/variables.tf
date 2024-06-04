variable "methods" {
  description = "List of methods"
  type        = list(object({
    restApi   = string
    resource = string
    hhtpMethod     = string
  }))
}

variable "functions" {
  description = "list of functions"
  type        = list(object({
    lambda_arn   = string
    function_name = string
  }))
}