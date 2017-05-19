class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :zip1
      t.string :zip2

      t.timestamps null: false
    end
  end
end
