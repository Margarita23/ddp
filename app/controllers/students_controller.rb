class StudentsController < ApplicationController
  load_and_authorize_resource
  before_action :set_student, only: %i[ show edit update destroy ]

  def index
    @students = Student.all
  end

  def show
    # create_pdf
    
    @diploma = @student.diploma

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "file_name", template: "students/show", formats: [:html], :encoding => 'UTF-8'
      end
    end
  end

  def new
    @student = Student.new
    @diploma = @student.build_diploma(params[:diploma])
  end

  def edit
    @teachers = Teacher.all
  end

  def create
    @student = Student.new(student_params)
    @student.group_id = params[:group_id]

    respond_to do |format|
      if @student.save
        @diploma = @student.create_diploma(params[:diploma])

        format.html { redirect_back fallback_location: root_path, notice: "Student was successfully created." }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @student.diploma = Diploma.new(params[:diploma])
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

  def destroy
    defense_process_id = @student.get_group.defense_process_id
    group_id = @student.group_id

    @student.destroy

    respond_to do |format|
      format.html { redirect_to defense_process_group_path(defense_process_id, group_id), notice: "Student was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  #Start
  def create_pdf
    pdf_html = ActionController::Base.new.render_to_string(template: 'protocols/show', layout: false)
    pdf = WickedPdf.new.pdf_from_string(pdf_html,
      :encoding => 'UTF-8',
      :page_size => 'A4',
      :orientation => 'Portrait')
    # pdf = WickedPdf.new.pdf_from_string('<!doctype html><html><head></head><body>Привіт</body></html>',
    #   :encoding => 'UTF-8',
    #   :page_size => 'A4',
    #   :orientation => 'Portrait')

      send_data(pdf, :filename  => 'myPDF', :disposition => 'attachment')
      
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end

    def student_params
      params.fetch(:student, [:diploma]).permit(:full_name, :theme, :date, :teacher_id, :commission_id, diploma_attributes: [:theme, :pages, :presentation, :language, :student_id, :mark, :sample_type])
    end

end
