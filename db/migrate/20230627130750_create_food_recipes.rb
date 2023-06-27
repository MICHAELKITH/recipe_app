class CreateFoodRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :food_recipes, id: :primary_key do |t|
      t.integer :Quantity
      t.timestamps
      t.references :recipes foreign_key: true
      t.references :foods foreign_key: true
    end
  end
end
