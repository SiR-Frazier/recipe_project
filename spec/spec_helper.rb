ENV['RACK_ENV'] = 'test'
require 'rspec' 
require 'pry'
require 'pg'
require 'Recipe'
require 'Ingredient'

RSpec.configure do |config|
  config.after(:each) do
    Recipe.all().each() do |recipe|
      recipe.destroy()
    end
  end
    Ingredient.all().each() do |ingredient|
      ingredient.destroy()
    end
  end
end
