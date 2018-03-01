require('sinatra')
require('sinatra/reloader')
require('sinatra/activerecord')
also_reload('lib/**/*.rb')
require('pry')
require('pg')
require('./lib/recipes')
require('./lib/tags')
require('./lib/ingredients')
require('./lib/ingredients_recipes')
require('./lib/recipes_tags')


get('/') do
  @recipe_list = Recipe.all()
  @tags = Tag.all
  @ingredients = Ingredient.all
  erb(:home)
end

post('/') do
  title = fetch.params("title")
  Recipe.create({:title => title, :id => nil})
  @recipe_list = Recipe.all()
  @tags = Tag.all
  @ingredients = Ingredient.all
  erb(:home)
end

get('/recipes/:id') do
  @recipe = Recipe.find(params.fetch("id").to_i())
  @ingredient = Ingredient.find(params.fetch("id").to_i)
  @tag = Tag.find(params.fetch("id").to_i)
  rating = params.fetch("rating")
  directions = params.fetch("directions")
  ingredients = params.fetch("ingredients")
  tag = params.fetch("tag")
  @rating = @recipe.rating
  @directions = @recipe.directions
  @ingredients = @ingredient.ingredients
  @tags = @tag.tags
  erb(:recipes)
end

patch('recipes/:id') do
  title = params.fetch("title")
  directions = params.fetch("directions")
  ingredients = params.fetch("ingredients")
  tags = params.fetch("tag")
  @recipe = Recipe.find(params.fetch("id").to_i())
  @tag = Tag.find(params.fetch("id").to_i)
  @ingredients.Ingredient.find(params.fetch("id").to_i)

  @recipe.update({:rating => rating, :directions => directions})
  @tag.update({:name => name})
  @ingredients.update({:name => name})

  @title = @recipe.title
  @rating = @recipe.rating
  @ingredients = @ingredients.name
  @instructions = @recipe.instructions
  @tags = @tag.name
  erb(:recipes)
end
