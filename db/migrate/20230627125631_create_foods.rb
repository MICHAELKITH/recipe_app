class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :Name
      t.string :MeasurementUnit
      t.decimal :Price
      t.integer :Quantity
      t.timestamps
    end
  end
end
