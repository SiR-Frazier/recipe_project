class AddColToRecipes < ActiveRecord::Migration[5.1]
  def change
    add_column :ingredients, :rating, :string
  end
end
