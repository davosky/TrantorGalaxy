class CreatePlaces < ActiveRecord::Migration[7.2]
  def change
    create_table :places do |t|
      t.string :name
      t.integer :position
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
