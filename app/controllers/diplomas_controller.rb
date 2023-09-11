class DiplomasController < ApplicationController
  before_action :set_diploma, only: %i[ show edit update destroy ]

  def index
    @diplomas = Diploma.all
  end

  def show
  end

  def new
    @diploma = Diploma.new(student_id: params[:student_id])
  end

  def edit
  end

  def create
    @diploma = Diploma.new(diploma_params)

    respond_to do |format|
      if @diploma.save
        format.html { redirect_to diploma_url(@diploma), notice: "Diploma was successfully created." }
        format.json { render :show, status: :created, location: @diploma }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @diploma.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @diploma.update(diploma_params)
        format.html { redirect_to diploma_url(@diploma), notice: "Diploma was successfully updated." }
        format.json { render :show, status: :ok, location: @diploma }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @diploma.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @diploma.destroy

    respond_to do |format|
      format.html { redirect_to diplomas_url, notice: "Diploma was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_diploma
      @diploma = Diploma.find(params[:id])
    end

    def diploma_params
      params.require(:diploma).permit(:theme, :pages, :presentation, :language, :student_id, :mark, :sample_type)
    end
end
