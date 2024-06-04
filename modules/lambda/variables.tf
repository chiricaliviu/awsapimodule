variable "roles" {
    description = "Contains the definitions of the roles. It's a list of objects"
    type = list(object(
        {role_name = string  
        role_arn = string
        }))
}