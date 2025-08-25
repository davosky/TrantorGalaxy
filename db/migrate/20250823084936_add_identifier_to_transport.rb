class AddIdentifierToTransport < ActiveRecord::Migration[7.2]
  def change
    add_column :transports, :identifier, :integer
  end
end
