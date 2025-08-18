class AddSignaturesToUser < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :signature, :string
    add_column :users, :validator_signature, :string
    add_column :users, :confirmator_signature, :string
  end
end
