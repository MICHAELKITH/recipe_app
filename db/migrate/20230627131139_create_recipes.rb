class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes, id: :primary_key do |t|
      t.string :Name
      t.timestamps :PreparationTime
      t.timestamps :CookingTime
      t.string :Description
      t.boolean :Public
      t.references :users, foreign_key: true
      t.timestamps
    end
  end
end
