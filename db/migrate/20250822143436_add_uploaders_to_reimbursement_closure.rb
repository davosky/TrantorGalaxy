class AddUploadersToReimbursementClosure < ActiveRecord::Migration[7.2]
  def change
    add_column :reimbursement_closures, :print_reimbursement, :string
    add_column :reimbursement_closures, :summary_reimbursement, :string
    add_column :reimbursement_closures, :highway_movement_reimbursement, :string
    add_column :reimbursement_closures, :receipt_one_reimbursement, :string
    add_column :reimbursement_closures, :receipt_two_reimbursement, :string
    add_column :reimbursement_closures, :receipt_three_reimbursement, :string
    add_column :reimbursement_closures, :receipt_four_reimbursement, :string
    add_column :reimbursement_closures, :receipt_five_reimbursement, :string
    add_column :reimbursement_closures, :receipt_six_reimbursement, :string
  end
end
