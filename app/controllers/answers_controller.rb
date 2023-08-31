class AnswersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[create]
  
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.build(answer_params)
    if @answer.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end
  
  private

  def answer_params
    params.require(:answer).permit(:name, :description)
  end

end
