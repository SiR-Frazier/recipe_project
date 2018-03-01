class Recipe < ActiveRecord::Base
  has_many :ingredients_recipes # points to join table
  has_many :ingredients, through: :ingredients_recipes # links ingredients
end
