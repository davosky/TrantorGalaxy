class AddInstituteLogoToUser < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :institute_logo, :string
  end
end
