# frozen_string_literal: true

class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :Name
      t.time :PreparationTime
      t.time :CookingTime
      t.text :Description
      t.boolean :Public
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
