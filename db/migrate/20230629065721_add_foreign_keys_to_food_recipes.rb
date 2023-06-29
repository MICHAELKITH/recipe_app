class AddForeignKeysToFoodRecipes < ActiveRecord::Migration[7.0]
  def change
    add_reference :food_recipes, :recipe, null: false, foreign_key: true
    add_reference :food_recipes, :food, null: false, foreign_key: true
  end
end
