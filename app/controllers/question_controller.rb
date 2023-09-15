class QuestionController < ApplicationController
    def create
        @question = Question.new(question_params)
        @question.user_id = current_user.id
    
        respond_to do |format|
          if @defense_process.save
            format.html { redirect_to defense_process_url(@defense_process), notice: "Defense process was successfully created." }
            format.json { render :show, status: :created, location: @defense_process }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @defense_process.errors, status: :unprocessable_entity }
          end
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_defense_process
      @question = Question.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def question_params
      params.fetch(:question, {}).permit(:question)
    end
end
