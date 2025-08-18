class CreateReimbursements < ActiveRecord::Migration[7.2]
  def change
    create_table :reimbursements do |t|
      # Identifiers
      t.integer :name

      # Dates
      t.date :departure_date
      t.date :return_date
      t.date :request_date
      t.date :reimbursement_date

      # Expences
      t.decimal :parking_cost, precision: 8, scale: 2, default: 0.00
      t.decimal :food_cost, precision: 8, scale: 2, default: 0.00
      t.decimal :room_cost, precision: 8, scale: 2, default: 0.00
      t.decimal :ticket_cost, precision: 8, scale: 2, default: 0.00
      t.decimal :generic_cost, precision: 8, scale: 2, default: 0.00
      t.decimal :total_amount, precision: 8, scale: 2, default: 0.00 # calculated sum value before_save

      # Descriptions
      t.integer :user_id, null: true # reference that don't need forengin key
      t.integer :reason_id, null: true # reference that don't need forengin key
      t.integer :road_id, null: true # reference that don't need forengin key
      t.integer :place_id, null: true # reference that don't need forengin key
      t.integer :structure_id, null: true # reference that don't need forengin key
      t.integer :transport_id, null: true # reference that don't need forengin key
      t.integer :vehicle_id, null: true # reference that don't need forengin key

      # Free fill Duplicates (fr stands for free like free-fill)
      t.string :user_fr # it copy the linked fields in to a static field to preserve if user is deleted
      t.string :reason_fr # it copy the linked field in to a static field to preserve if reason is deleted
      t.string :road_fr # it copy the linked field in to a static field to preserve if road is deleted
      t.string :place_fr # it copy the linked id field to a static field to preserve if pleace is deleted
      t.string :structure_fr # it copy the linked field in to a static field to preserve if structure is deleted
      t.string :transport_fr # it copy the linked field in to a static field to preserve if transport is deleted
      t.string :vehicle_fr # it copy the linked fields in to a static field to preserve if veichle is deleted
      t.decimal :highway_cost_fr, precision: 8, scale: 2, default: 0.00
      t.decimal :road_lenght_fr, precision: 8, scale: 2, default: 0.00

      t.timestamps
    end
  end
end
