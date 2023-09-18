class QuestionsController < ApplicationController
    def create
        @question = Question.new(question_params)
        student_id = params[:student_id]
        teacher = params[:question][:teacher]
        puts "!!!!!!!!"
        puts student_id
        puts teacher
        # @question.user_id = current_user.id

        if @question.save
            flash[:notice] = "New question was successfully created"
          else
            flash[:alert] = "New question wasn't successfully created"
          end
          redirect_to student_path(id: student_id)
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_defense_process
      @question = Question.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def question_params
      params.fetch(:question, {}).permit(:teacher, :text, :diploma_id)
    end
end
