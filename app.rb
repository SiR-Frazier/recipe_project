require('sinatra')
require('sinatra/reloader')
require('sinatra/activerecord')
also_reload('lib/**/*.rb')
require('pry')
require('pg')
require('./lib/recipes')
require('./lib/tags')
require('./lib/ingredients')


get('/') do
  @recipe_list = Recipe.all()
  @tags = Tag.all
  @ingredients = Ingredient.all
  erb(:home)
end

post('/') do
  title = params.fetch("title")
  rating = params.fetch("rating")
  directions = params.fetch("directions")

  Recipe.create({:title => title, :rating => rating, :directions => directions})
  @recipe_list = Recipe.all()
  erb(:home)
end

get('/recipes/:id') do
  @recipe = Recipe.find(params.fetch("id").to_i())


  @title = @recipe.title
  @directions = @recipe.directions

  @ingredients_list = Ingredient.all
  @recipe_list = Recipe.all
  erb(:recipes)
end

patch('/recipes/:id') do

  recipe_name = params.fetch("title")
  directions = params.fetch("directions")
  recipe_id = params.fetch("id").to_i

  @recipe = Recipe.find(recipe_id)
  @recipe_name = @recipe.title
  @directions = @recipe.directions
  @ingredients = Ingredient.find(params.fetch("id"))

  @ingredient = @ingredients.name
  Ingredient.update({:directions => directions})

  @recipe_list = Recipe.all
  @ingredients_list = Ingredient.all

  erb(:recipes)
end

get('/recipes/:id/edit-ingredient') do
  @recipe = Recipe.find(params.fetch("id"))
  @ingredients = params[:ingredients]
  @ingredients_list = Ingredient.all
  @recipe_list = Recipe.all
  erb(:ingredients_edit)
end

post('/recipes/:id/edit-ingredient') do
  @recipe = Recipe.find(params.fetch("id").to_i)
  ingredient_name = params.fetch("ingredients")
  Ingredient.create({:name => ingredient_name})
  @ingredients_list = Ingredient.all
  @recipe_list = Recipe.all

  erb :ingredients_edit
end

get('/recipes/:id/edit-directions') do
  @recipe = Recipe.find(params.fetch("id").to_i)
  @directions = params.fetch("directions")
  @recipe_list = Recipe.all
  erb :directions_edit
end

post('/recipes/:id/edit-directions') do
  @recipe = Recipe.find(params.fetch("id").to_i)
  directions = params.fetch("directions")
  Recipe.create({:directions => directions})
  @recipe_list = Recipe.all
  erb :directions_edit
end

patch('/recipes/:id') do
  rating = params.fetch("rating").to_i
  directions = params.fetch("directions")
  ingredients = params.fetch("ingredients")
  tags = params.fetch("tag")
  @recipe = Recipe.find(params.fetch("id").to_i())
  @tag = Tag.find(params.fetch("id").to_i)
  @ingredients = Ingredient.find(params.fetch("id").to_i)

  @recipe.update({:rating => rating, :directions => directions})
  @tag.update({:name => name})
  @ingredients.update({:name => name})

  @title = @recipe.title
  @rating = @recipe.rating
  @ingredients = @ingredients.name
  @directions = @recipe.directions
  @tags = @tag.name
  redirect("/recipes/#{@recipe.id.to_s}")
end
