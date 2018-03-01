class Ingredient < ActiveRecord::Base
  belongs_to :ingredients # singular, single instance of ingredient
  belongs_to :recipes # singular, single instance of recipe
end
