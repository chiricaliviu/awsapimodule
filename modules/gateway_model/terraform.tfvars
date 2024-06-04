models = [
  {
    name         = "ExampleModel1"
    description  = "First example model"
    content_type = "application/json"
    schema       = jsonencode({
      type = "object",
      properties = {
        id   = { type = "string" },
        name = { type = "string" }
      },
      required = ["id", "name"]
    })
  },
  {
    name         = "ExampleModel2"
    description  = "Second example model"
    content_type = "application/json"
    schema       = jsonencode({
      type = "object",
      properties = {
        id    = { type = "string" },
        value = { type = "string" }
      },
      required = ["id", "value"]
    })
  }
]