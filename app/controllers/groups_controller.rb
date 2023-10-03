class GroupsController < ApplicationController
  load_and_authorize_resource :defense_process
  load_and_authorize_resource :group, :through => :defense_process
  before_action :set_group, only: %i[ show edit update destroy ]

  def show
    @student = Student.new
    @teachers = Teacher.all
  end

  def new
    @group = Group.new
  end

  def edit
  end

  def create
    @group = @defense_process.groups.build(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to defense_process_group_url(@defense_process.id, @group), notice: "Group was successfully created." }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to defense_process_group_url(@defense_process.id, @group), notice: "Group was successfully updated." }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @group.destroy

    respond_to do |format|
      format.html { redirect_to defense_process_url(@defense_process.id), notice: "Group was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_group
      @group = @defense_process.groups.find(params[:id])
    end

    def group_params
      params.fetch(:group, {}).permit(:form, :specialization, :name_number, :specialty_code, :degree, :commission_id)
    end
end
