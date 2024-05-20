dynamodb_table_configs = [
        {
            table_name = "dietA"
            billing_mode = "PAY_PER_REQUEST"
            hash_key = "Dietid"
            attribute_name = "Dietid"
        },
        {
            table_name = "ingredientA"
            billing_mode = "PAY_PER_REQUEST"
            hash_key = "ingredientid"
            attribute_name = "ingredientid"
        },
        {
            table_name = "ingredientslistA"
            billing_mode = "PAY_PER_REQUEST"
            hash_key = "ingredientslistid"
            attribute_name = "ingredientslistid"
        },
        {
            table_name = "cookingstepA"
            billing_mode = "PAY_PER_REQUEST"
            hash_key = "cookingstepid"
            attribute_name = "cookingstepid"
        },
        {
            table_name = "cookingstepslistA"
            billing_mode = "PAY_PER_REQUEST"
            hash_key = "cookingstepslistid"
            attribute_name = "cookingstepslistid"
        },
        {
            table_name = "recipeA"
            billing_mode = "PAY_PER_REQUEST"
            hash_key = "recipeid"
            attribute_name = "recipeid"
        }
    
]
 


 table_names = ["diet", "ingredient", "ingredientslist", "cookingstep", "cookingstepslist", "recipe"]

