class AddTables < ActiveRecord::Migration[5.1]
  def change
    create_table(:ingredients) do |t|
      t.column(:name, :string)
      t.timestamps
    end
    create_table(:recipes) do |t|
      t.column(:title, :string)
      t.column(:directions, :text)
      t.column(:rating, :string)
      t.timestamps
    end
    create_table(:tags) do |t|
      t.column(:name, :string)
      t.timestamps
    end
    create_table(:recipes_tags) do |t|
      t.column(:recipe_id, :integer)
      t.column(:tag_id, :integer)
      t.timestamps
    end
    create_table(:ingredients_recipes) do |t|
      t.column(:recipe_id, :integer)
      t.column(:ingredient_id, :integer)
      t.timestamps
    end
  end
end
