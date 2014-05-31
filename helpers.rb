require 'pg'

def db_connection
  begin
    connection = PG.connect(dbname: 'recipes')
    yield(connection)
  ensure
    connection.close
  end
end

def find_recipes(letter)
  letter == "A" ? nums = "OR recipes.name ~ '^[0-9]+' " : nums = ""
  db_connection do |conn|
    query = "SELECT recipes.name, recipes.id, recipes.description, recipes.instructions
             FROM recipes
             WHERE recipes.description IS NOT NULL AND recipes.instructions IS NOT NULL
             AND recipes.name LIKE '#{letter}%' " + nums + "ORDER BY recipes.name"
    conn.exec(query)
  end
end

def recipe_details(id)
  db_connection do |conn|
    query = "SELECT recipes.name AS name, recipes.id, recipes.instructions, recipes.description,
             ingredients.name AS ingredient
             FROM recipes
              JOIN ingredients ON recipes.id = ingredients.recipe_id
             WHERE recipes.id = #{id}"
    conn.exec(query)
  end
end
