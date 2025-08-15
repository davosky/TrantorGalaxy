class ReasonsController < ApplicationController
  before_action :set_reason, only: %i[ show edit update destroy ]

  def index
    @reasons = Reason.where(user_id: current_user.id).order(position: "ASC")
  end

  def show
  end

  def new
    @reason = Reason.new
  end

  def edit
  end

  def create
    @reason = current_user.reasons.build(reason_params)

    if @reason.save
      redirect_to reasons_url, notice: "Il Motivo Missione è stato creato con successo."
    else
      render :form_update, status: :unprocessable_entity
    end
  end

  def update
    if @reason.update(reason_params)
      redirect_to reasons_url, notice: "Il Motivo Missione è stato modificato con successo."
    else
      render :form_update, status: :unprocessable_entity
    end
  end

  def destroy
    @reason.destroy!

    redirect_to reasons_url, notice: "Il Motivo Missione è stato eliminato con successo."
  end

  private

  def set_reason
    @reason = Reason.find(params[:id])
  end

  def reason_params
    params.require(:reason).permit(:name, :position, :user_id)
  end
end
