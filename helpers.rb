require 'pg'

def db_connection
  begin
    connection = PG.connect(dbname: 'recipes')
    yield(connection)
  ensure
    connection.close
  end
end

def find_recipes
  db_connection do |conn|
    query = "SELECT recipes.name, recipes.id FROM recipes ORDER BY recipes.name"
    conn.exec(query)
  end
end

def recipe_details(id)
  db_connection do |conn|
    query = "SELECT "
    conn.exec(query)
  end
end
