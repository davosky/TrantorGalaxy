class Road < ApplicationRecord
  belongs_to :user

  before_create :set_id

  def set_id
    last_id = Road.maximum(:id)
    self.id = last_id.to_i + 1
  end

  validates :name, :road_lenght, :position, presence: true
end
