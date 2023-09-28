class MarksController < ApplicationController
  def create
    @mark = Mark.new(mark_params)
    student_id = params[:student_id]

    if @mark.save
        flash[:notice] = "New mark was successfully created"
      else
        flash[:alert] = "New mark wasn't successfully created"
      end
      redirect_to student_path(id: student_id)
end

  def edit
  end

  def delete
  end

  private

    def mark_params
      params.fetch(:mark, {}).permit(:teacher_id, :mark, :diploma_id)
    end
end
