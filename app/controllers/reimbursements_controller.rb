class ReimbursementsController < ApplicationController
  before_action :set_reimbursement, only: %i[ show edit update destroy ]

  def index
    @reimbursements = Reimbursement.where(user_id: current_user.id).order(created_at: "DESC").page(params[:page])
  end

  def show
  end

  def new
    @reimbursement = Reimbursement.new
  end

  def edit
  end

  def print
    @q = Reimbursement.ransack(params[:q])
    @reimbursements = @q.result(distinct: true).order(name: "DESC").where(user_id: current_user.id)
    respond_to do |format|
      format.html
      format.json
      format.pdf { render template: "reimbursements/print", pdf: "print" }
    end
  end

  def print_list
    @q = Reimbursement.ransack(params[:q])
    @reimbursements = @q.result(distinct: true).order(name: "DESC").where(user_id: current_user.id)
    respond_to do |format|
      format.html
      format.json
      format.pdf { render template: "reimbursements/print_list", pdf: "print_list" }
    end
  end

  def create
    @reimbursement = current_user.reimbursements.build(reimbursement_params)

    if @reimbursement.save
      redirect_to reimbursements_url, notice: "Il Percorso è stato creato con successo."
    else
      render :form_update, status: :unprocessable_entity
    end
  end

  def update
    if @reimbursement.update(reimbursement_params)
      redirect_to reimbursements_url, notice: "Il Percorso è stato modificato con successo."
    else
      render :form_update, status: :unprocessable_entity
    end
  end

  def destroy
    @reimbursement.destroy!

    redirect_to reimbursements_url, notice: "Il Percorso è stato eliminato con successo."
  end

  private

  def set_reimbursement
    @reimbursement = Reimbursement.find(params[:id])
  end

  def reimbursement_params
    params.require(:reimbursement).permit(:name, :departure_date, :return_date, :request_date, :reimbursement_date, :parking_cost, :food_cost, :room_cost, :ticket_cost, :generic_cost, :total_amount, :user_id, :place_id, :reason_id, :vehicle_id, :road_id, :structure_id, :transport_id, :place_fr, :reason_fr, :road_fr, :structure_fr, :transport_fr, :vehicle_fr, :road_lenght_fr, :highway_cost_fr)
  end
end
