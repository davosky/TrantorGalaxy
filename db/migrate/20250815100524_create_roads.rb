class CreateRoads < ActiveRecord::Migration[7.2]
  def change
    create_table :roads do |t|
      t.string :name
      t.decimal :road_lenght, scale: 2, precision: 8
      t.decimal :highway_cost, scale: 2, precision: 8
      t.integer :position
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
