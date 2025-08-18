class Reimbursement < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :place, optional: true
  belongs_to :reason, optional: true
  belongs_to :vehicle, optional: true
  belongs_to :road, optional: true
  belongs_to :structure, optional: true
  belongs_to :transport, optional: true

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "departure_date", "food_cost", "generic_cost", "highway_cost_fr", "id", "id_value", "name", "parking_cost", "place_fr", "place_id", "reason_fr", "reason_id", "reimbursement_date", "request_date", "return_date", "road_fr", "road_id", "road_lenght_fr", "room_cost", "structure_fr", "structure_id", "ticket_cost", "total_amount", "transport_fr", "transport_id", "updated_at", "user_fr", "user_id", "vehicle_fr", "vehicle_id"]
  end

  before_create :set_id, :set_name

  def set_id
    last_id = Reimbursement.maximum(:id)
    self.id = last_id.to_i + 1
  end

  def set_name
    last_name = Reimbursement.maximum(:name)
    self.name = last_name.to_i + 1
  end

  before_save :fill_free_fields, :calculate_total

  # It fill free fields(_fr) from associations
  def fill_free_fields
    if self.user_id != nil
      self.user_fr = "#{self.user.first_name} #{self.user.last_name}"
    end

    if self.reason_id != nil
      self.reason_fr = self.reason.name
    end

    if self.road_id != nil
      self.road_fr = self.road.name
      if self.road.highway_cost != nil
        self.highway_cost_fr = self.road.highway_cost
      end
      if self.road.road_lenght != nil
        self.road_lenght_fr = self.road.road_lenght
      end
    end

    if self.place_id != nil
      self.place_fr = self.place.name
    end

    if self.structure_id != nil
      self.structure_fr = self.structure.name
    end

    if self.transport_id != nil
      self.transport_fr = self.transport.name
    end

    if self.vehicle_id != nil
      self.vehicle_fr = "#{self.vehicle.producer} #{self.vehicle.name} con targa: #{self.vehicle.licence_plate}"
    end
  end

  # It sum the expences fields to create total_amount
  def calculate_total
    if self.food_cost != nil
      food = self.food_cost
    else
      food = 0.00
    end

    if self.parking_cost != nil
      parking = self.parking_cost
    else
      parking = 0.00
    end

    if self.room_cost != nil
      room = self.room_cost
    else
      room = 0.00
    end

    if self.ticket_cost != nil
      ticket = self.ticket_cost
    else
      ticket = 0.00
    end

    if self.generic_cost != nil
      generic = self.generic_cost
    else
      generic = 0.00
    end

    if self.road_id != nil && self.road.highway_cost != nil
      highway = self.road.highway_cost
      self.highway_cost_fr = self.road.highway_cost
    elsif self.highway_cost_fr != nil
      highway = self.highway_cost_fr
    else
      highway = 0.00
    end

    # Check if it is a veichle and what type of
    if self.transport.name == "Veicolo Aziendale" # company vehicle
      sum_value = food + parking + room + ticket + generic + highway
    elsif self.transport.name == "Veicolo Privato" # private vehicle
      if self.road_id != nil
        partial_cost = self.road.road_lenght * self.vehicle.cost_per_km
      else
        partial_cost = self.road_lenght_fr * self.vehicle.cost_per_km
      end
      sum_value = food + parking + room + ticket + generic + highway + partial_cost
    else
      sum_value = food + parking + room + ticket + generic
    end

    self.total_amount = sum_value
  end

  # Validations
  validates :departure_date, :return_date, :request_date, :reimbursement_date, :transport_id, presence: true
end
