class DefenseProcessesController < ApplicationController
  load_and_authorize_resource :through => :current_user
  before_action :set_defense_process, only: %i[ show edit update destroy ]

  # GET /defense_processes or /defense_processes.json
  def index
    @defense_processes = DefenseProcess.all
  end

  # GET /defense_processes/1 or /defense_processes/1.json
  def show
    @group = Group.new
  end

  # GET /defense_processes/new
  def new
    @defense_process = DefenseProcess.new
  end

  # GET /defense_processes/1/edit
  def edit
  end

  # POST /defense_processes or /defense_processes.json
  def create
    @defense_process = DefenseProcess.new(defense_process_params)
    @defense_process.user_id = current_user.id

    respond_to do |format|
      if @defense_process.save
        format.html { redirect_to defense_process_url(@defense_process), notice: "Defense process was successfully created." }
        format.json { render :show, status: :created, location: @defense_process }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @defense_process.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /defense_processes/1 or /defense_processes/1.json
  def update
    respond_to do |format|
      if @defense_process.update(defense_process_params)
        format.html { redirect_to defense_process_url(@defense_process), notice: "Defense process was successfully updated." }
        format.json { render :show, status: :ok, location: @defense_process }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @defense_process.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /defense_processes/1 or /defense_processes/1.json
  def destroy
    @defense_process.destroy

    respond_to do |format|
      format.html { redirect_to defense_processes_url, notice: "Defense process was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_defense_process
      @defense_process = DefenseProcess.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def defense_process_params
      params.fetch(:defense_process, {})
    end
end
