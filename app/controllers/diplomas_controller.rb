class DiplomasController < ApplicationController
  load_and_authorize_resource :diploma
  before_action :set_diploma, only: %i[ show edit update destroy ]

  def show
  end

  def new
    @diploma = Diploma.new({student_id: params[:student_id]})
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

  private
    def set_diploma
      @diploma = Diploma.find(params[:id])
    end

    def diploma_params
      params.require(:diploma).permit(:theme, :pages, :presentation, :language, :student_id, :mark, :sample_type)
    end
end
