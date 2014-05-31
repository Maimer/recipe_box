require 'sinatra'
require_relative 'helpers.rb'

get '/' do
  redirect '/recipes'
end

get '/recipes' do
  @title = "Recipe Box"
  if params[:page] != nil
    @page = params[:page].to_s
  else
    @page = "A"
  end
  @recipes = find_recipes(@page)

  erb :'recipes/index'
end

get '/recipes/:id' do
  @id = params[:id]
  @details = recipe_details(@id)
  @title = @details[0]["name"]

  erb :'recipes/recipe'
end
