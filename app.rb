require('sinatra')
require('sinatra/reloader')
require('sinatra/activerecord')
also_reload('lib/**/*.rb')
require('pry')
require('pg')
require('./lib/recipe')
require('./lib/ingredient')
require('./lib/ingredients_recipes')


get('/') do
  @recipes = Recipe.all
  @tags = Tag.all
  @ingredients = Ingredient.all
  erb(:home)
end

post('/') do
  recipe_name = params.fetch("title")

  @recipe = Recipe.create({:title => title})
  @recipes = Recipe.all()
  erb(:home)
end

get('/recipes/:id') do
  @recipe = Recipe.find(params.fetch("id").to_i())
  rating = params.fetch("rating")
  directions = params.fetch("directions")
  ingredients = params.fetch("ingredients")
  tag = params.fetch("tag")
  @rating = @recipe.rating
  @directions = @recipe.directions
  @ingredients = @recipe.ingredients
  @tags = @recipe.tags
  erb(:recipe_view)

patch('recipes/:id') do
  title = params.fetch("title")
  directions = params.fetch("directions")
  @recipe = Recipe.find(params.fetch("id").to_i())
  @recipe.update({:directions => directions})
  @ingredients = @recipe.ingredients
  @tags = @recipe.tags
  erb(:recipe_edit)
end
