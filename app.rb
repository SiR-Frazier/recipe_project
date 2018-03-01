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
  erb(:home)
end

post('/') do
  title = params.fetch("title")
  rating = params.fetch("rating")
  directions = params.fetch("directions")
  @recipe = Recipe.create({:title => title, :rating => rating})
  @recipes = Recipe.all()
  erb(:home)
end
