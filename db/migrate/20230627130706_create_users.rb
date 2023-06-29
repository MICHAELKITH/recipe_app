# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, id: :primary_key do |t|
      t.string :Name
      t.timestamps
    end
  end
end
