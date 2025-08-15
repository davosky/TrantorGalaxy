class CreateTransports < ActiveRecord::Migration[7.2]
  def change
    create_table :transports do |t|
      t.string :name
      t.integer :position
      t.references :user, null: true, foreign_key: false

      t.timestamps
    end
  end
end
