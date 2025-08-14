class VehiclesController < ApplicationController
  before_action :set_vehicle, only: %i[ show edit update destroy ]

  def index
    @vehicles = Vehicle.all
    @vehicles = Vehicle.where(user_id: current_user.id).order(position: "ASC")
  end

  def show
  end

  def new
    @vehicle = Vehicle.new
  end

  def edit
  end

  def create
    @vehicle = current_user.vehicles.build(vehicle_params)

    if @vehicle.save
      redirect_to vehicles_url, notice: "Il Veicolo è stato creato con successo."
    else
      render :form_update, status: :unprocessable_entity
    end
  end

  def update
    if @vehicle.update(vehicle_params)
      redirect_to vehicles_url, notice: "Il Veicolo è stato modificato con successo."
    else
      render :form_update, status: :unprocessable_entity
    end
  end

  def destroy
    @vehicle.destroy!

    redirect_to vehicles_url, notice: "Il Veicolo è stato eliminato con successo."
  end

  private

  def set_vehicle
    @vehicle = Vehicle.find(params[:id])
  end

  def vehicle_params
    params.require(:vehicle).permit(:name, :producer, :licence_plate, :cost_per_km, :position, :user_id)
  end
end
