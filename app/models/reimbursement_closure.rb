class ReimbursementClosure < ApplicationRecord
  before_create :set_id, :set_name

  def set_id
    last_id = ReimbursementClosure.maximum(:id)
    self.id = last_id.to_i + 1
  end

  def set_name
    last_name = ReimbursementClosure.maximum(:name)
    self.name = last_name.to_i + 1
  end

  belongs_to :user

  mount_uploader :print_reimbursement, PrintReimbursementUploader
  mount_uploader :summary_reimbursement, SummaryReimbursementUploader
  mount_uploader :highway_movement_reimbursement, HighwayMovementReimbursementUploader
  mount_uploader :receipt_one_reimbursement, ReceiptOneReimbursementUploader
  mount_uploader :receipt_two_reimbursement, ReceiptTwoReimbursementUploader
  mount_uploader :receipt_three_reimbursement, ReceiptThreeReimbursementUploader
  mount_uploader :receipt_four_reimbursement, ReceiptFourReimbursementUploader
  mount_uploader :receipt_five_reimbursement, ReceiptFiveReimbursementUploader
  mount_uploader :receipt_six_reimbursement, ReceiptSixReimbursementUploader

  validates :year, presence: true
  validates_presence_of :month, unless: :period?
  validates_presence_of :period, unless: :month?

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "highway_movement_reimbursement", "id", "id_value", "month", "name", "payment", "payment_date", "period", "print_reimbursement", "receipt_five_reimbursement", "receipt_four_reimbursement", "receipt_one_reimbursement", "receipt_six_reimbursement", "receipt_three_reimbursement", "receipt_two_reimbursement", "summary_reimbursement", "updated_at", "user_id", "year"]
  end
end
