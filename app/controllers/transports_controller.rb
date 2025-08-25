class TransportsController < ApplicationController
  before_action :set_transport, only: %i[ show edit update destroy ]

  def index
    @transports = Transport.where(user_id: current_user.id).order(position: "ASC")
  end

  def show
  end

  def new
    @transport = Transport.new
  end

  def edit
  end

  def create
    @transport = current_user.transports.build(transport_params)

    if @transport.save
      redirect_to transports_url, notice: "Il Trasporto è stato creato con successo."
    else
      render :form_update, status: :unprocessable_entity
    end
  end

  def update
    if @transport.name == "Veicolo Aziendale" || @transport.name == "Veicolo Privato" || @transport.identifier == 1 || @transport.identifier == 2
      redirect_to transports_url, notice: "Record di sistema non modificabile"
    else
      if @transport.update(transport_params)
        redirect_to transports_url, notice: "Il Trasporto è stato modificato con successo."
      else
        render :form_update, status: :unprocessable_entity
      end
    end
  end

  def destroy
    if @transport.name == "Veicolo Aziendale" || @transport.name == "Veicolo Privato" || @transport.identifier == 1 || @transport.identifier == 2
      redirect_to transports_url, notice: "Record di sistema non cancellabile"
    else
      @transport.destroy!

      redirect_to transports_url, notice: "Il Trasporto è stato eliminato con successo."
    end
  end

  private

  def set_transport
    @transport = Transport.find(params[:id])
  end

  def transport_params
    params.require(:transport).permit(:name, :position, :user_id)
  end
end
