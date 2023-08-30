class StudentsController < ApplicationController
  load_and_authorize_resource
  before_action :set_student, only: %i[ show edit update destroy ]

  # GET /students or /students.json
  def index
    @students = Student.all
  end

  # GET /students/1 or /students/1.json
  def show
    # create_pdf
    # @student = scope.find(params[:id])

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "file_name", template: "students/show", formats: [:html]
      end
    end
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students or /students.json
  def create
    @student = Student.new(student_params)
    @student.group_id = params[:group_id]

    respond_to do |format|
      if @student.save
        format.html { redirect_back fallback_location: root_path, notice: "Student was successfully created." }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1 or /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to student_url(@student), notice: "Student was successfully updated." }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1 or /students/1.json
  def destroy
    @student.destroy

    respond_to do |format|
      format.html { redirect_to students_url, notice: "Student was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  #Start
  def create_pdf
    pdf = WickedPdf.new.pdf_from_string('<!doctype html><html><head></head><body>Привіт</body></html>',
      :encoding => 'UTF-8',
      :page_size => 'A4',
      :orientation => 'Portrait')

      send_data(pdf, :filename  => 'myPDF', :disposition => 'attachment')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def student_params
      params.fetch(:student, {}).permit(:full_name, :theme, :leader, :date)
    end
end
