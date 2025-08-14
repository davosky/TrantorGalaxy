class Vehicle < ApplicationRecord
  belongs_to :user

  before_create :set_id

  def set_id
    last_id = Vehicle.maximum(:id)
    self.id = last_id.to_i + 1
  end

  validates :name, :producer, :licence_plate, :cost_per_km, :position, presence: true
  validates :licence_plate, uniqueness: true
end
