class CreateReimbursementClosures < ActiveRecord::Migration[7.2]
  def change
    create_table :reimbursement_closures do |t|
      t.string :year
      t.string :month
      t.string :period
      t.boolean :payment
      t.date :payment_date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
