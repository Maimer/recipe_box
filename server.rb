require 'sinatra'

get '/' do
  redirect '/recipes'
end

get '/recipes' do
  @title = Recipe Box
  @recipes = find_recipes()

  erb :'recipes/index'
end

get '/recipes/:id' do
  @details = recipe_details(@id)
  @id = params[:id]
  @title =

  erb :'recipes/recipe'
end
