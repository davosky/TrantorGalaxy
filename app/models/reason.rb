class Reason < ApplicationRecord
  belongs_to :user

  before_create :set_id

  def set_id
    last_id = Reason.maximum(:id)
    self.id = last_id.to_i + 1
  end

  validates :name, :position, presence: true
end
