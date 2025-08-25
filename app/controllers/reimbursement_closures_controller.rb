class ReimbursementClosuresController < ApplicationController
  load_and_authorize_resource

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.html { redirect_to reimbursement_closures_url, alert: exception.message }
      format.json { render json: { error: exception.message }, status: :forbidden }
      format.js { render "access_denied", status: :forbidden }
    end
  end

  before_action :set_reimbursement_closure, only: %i[ show edit update destroy ]

  def index
    if current_user.admin == true || current_user.payroll == true
      @q = ReimbursementClosure.ransack(params[:q])

      @reimbursement_closures = @q.result(distinct: true).order(name: "DESC").where(user_id: User.where(province: current_user.province, region: current_user.region))
    else
      @reimbursement_closures = ReimbursementClosure.where(user_id: current_user.id).order(created_at: "DESC")
    end
  end

  def show
  end

  def new
    @reimbursement_closure = ReimbursementClosure.new
  end

  def edit
  end

  def print
    @q = ReimbursementClosure.ransack(params[:q])

    @reimbursement_closures = @q.result(distinct: true).order(name: "DESC").where(user_id: current_user.id)
    respond_to do |format|
      format.html
      format.json
      format.pdf { render template: "reimbursement_closures/print", pdf: "print" }
    end
  end

  def print_list
    @user = current_user
    @q = ReimbursementClosure.ransack(params[:q])
    @reimbursement_closures = @q.result(distinct: true).order(name: "DESC").where(user_id: current_user.id)
    respond_to do |format|
      format.html
      format.json
      format.pdf { render template: "reimbursement_closures/print_list", pdf: "print_list" }
    end
  end

  def create
    @reimbursement_closure = current_user.reimbursement_closures.build(reimbursement_closure_params)

    if @reimbursement_closure.save
      redirect_to reimbursement_closures_url, notice: "La Chiusura Rimborsi è stata creata con successo."
    else
      render :form_update, status: :unprocessable_entity
    end
  end

  def update
    if @reimbursement_closure.update(reimbursement_closure_params)
      redirect_to reimbursement_closures_url, notice: "La Chiusura Rimborsi è stata modificata con successo."
    else
      render :form_update, status: :unprocessable_entity
    end
  end

  def destroy
    @reimbursement_closure.destroy!

    redirect_to reimbursement_closures_url, notice: "La Chiusura Rimborsi è stata eliminata con successo."
  end

  private

  def set_reimbursement_closure
    @reimbursement_closure = ReimbursementClosure.find(params[:id])
  end

  def reimbursement_closure_params
    params.require(:reimbursement_closure).permit(:year, :month, :period, :payment, :payment_date, :user_id, :print_reimbursement, :summary_reimbursement, :highway_movement_reimbursement, :receipt_one_reimbursement, :receipt_two_reimbursement, :receipt_three_reimbursement, :receipt_four_reimbursement, :receipt_five_reimbursement, :receipt_six_reimbursement)
  end
end
