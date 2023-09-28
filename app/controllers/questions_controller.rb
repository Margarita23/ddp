class QuestionsController < ApplicationController
    def create
        @question = Question.new(question_params)
        student_id = params[:student_id]

        if @question.save
            flash[:notice] = "New question was successfully created"
          else
            flash[:alert] = "New question wasn't successfully created"
          end
          redirect_to student_path(id: student_id)
    end

    private

    def question_params
      params.fetch(:question, {}).permit(:teacher_id, :text, :diploma_id)
    end
end
