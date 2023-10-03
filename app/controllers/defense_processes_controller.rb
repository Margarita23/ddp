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
      flash[:notice] = "Новий захист успішно створений!"
    else
      flash[:alert] = "Щось пішло не так :( Новий захист не створений!" 
    end

    redirect_back fallback_location: root_path
  end

  def update
      if @defense_process.update(defense_process_params)
        flash[:notice] = "Дані захисту успішно оновлений!"
      else
        flash[:alert] = "Щось пішло не так :( Захист не оновився!" 
      end

    redirect_to defense_process_url(@defense_process)
  end

  def destroy
    @defense_process.destroy

    respond_to do |format|
      format.html { redirect_to defense_processes_url, notice: "Захист успішно видалений." }
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
