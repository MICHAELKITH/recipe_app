class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :Name
      t.timestamps :PreparationTime
      t.timestamps :CookingTime
      t.string :Description
      t.boolean :Public
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
