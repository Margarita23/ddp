class DefenseProcessesController < ApplicationController
  load_and_authorize_resource :through => :current_user
  before_action :set_defense_process, only: %i[ show edit update destroy ]

  def index
    @defense_processes = DefenseProcess.all
  end

  def show
    @group = Group.new
  end

  def new
    @defense_process = DefenseProcess.new
  end

  def edit
  end

  def create
    @defense_process = DefenseProcess.new(defense_process_params)
    @defense_process.user_id = current_user.id

    if @defense_process.save
      flash[:notice] = "New defense process was successfully created"
      # format.html { redirect_to defense_process_url(@defense_process), notice: "Defense process was successfully created." }
      # format.json { render :show, status: :created, location: @defense_process }
    else
      flash[:alert] = "New defense process wasn't successfully create" 
      # format.html { render :new, status: :unprocessable_entity }
      # format.json { render json: @defense_process.errors, status: :unprocessable_entity }
    end

    redirect_to root_path
  end

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

  def destroy
    @defense_process.destroy

    respond_to do |format|
      format.html { redirect_to defense_processes_url, notice: "Defense process was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_defense_process
      @defense_process = DefenseProcess.find(params[:id])
    end

    def defense_process_params
      params.fetch(:defense_process, {}).permit(:nameID)
    end
end
