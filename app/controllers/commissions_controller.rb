class CommissionsController < ApplicationController
  before_action :set_commission, only: %i[ show edit update destroy ]

  def index
    @commissions = Commission.all
  end

  def show
  end

  def new
    @commission = Commission.new
  end

  def edit
  end

  def create
    @commission = Commission.new(commission_params)

    respond_to do |format|
      if @commission.save
        format.html { redirect_to commission_url(@commission), notice: "Commission was successfully created." }
        format.json { render :show, status: :created, location: @commission }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @commission.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @commission.update(commission_params)
        format.html { redirect_to commission_url(@commission), notice: "Commission was successfully updated." }
        format.json { render :show, status: :ok, location: @commission }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @commission.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @commission.destroy

    respond_to do |format|
      format.html { redirect_to commissions_url, notice: "Commission was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_commission
      @commission = Commission.find(params[:id])
    end

    def commission_params
      params.require(:commission).permit(:name, :number, :head_id, :eval_method_id, teacher_ids: [])
    end
end
