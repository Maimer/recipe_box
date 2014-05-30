require 'pg'

def db_connection
  begin
    connection = PG.connect(dbname: 'slacker')

    yield(connection)

  ensure
    connection.close
  end
end

def find_recipes
  db_connection do |conn|
    query = "SELECT recipes.name "
    conn.exec(query)
  end
end

def recipe_details(id)
  db_connection do |conn|
    query = ""
    conn.exec(query)
  end
end
