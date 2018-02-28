class CreateClassTables < ActiveRecord::Migration[5.1]
  def change
    create_table(:ingredients) do |t|
      t.column(:name, :string)
    end

    create_table(:tags) do |t|
      t.column(:name, :string)
    end

    create_table(:recipes) do |t|
      t.column(:title, :string)
      t.column(:directions, :string)
    end

    create_table(:ingredients_recipes) do |t|
      t.column(:ingredient_id, :int)
      t.column(:recipe_id, :int)
    end

    create_table(:tags_recipes) do |t|
      t.column(:tag_id, :int)
      t.column(:recipe_id, :int)
    end
  end
end
