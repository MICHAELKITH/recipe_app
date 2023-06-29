class AddUserIdToFoodRecipes < ActiveRecord::Migration[7.0]
  def change
    add_reference :food_recipes, :user, null: false, foreign_key: true
  end
end
