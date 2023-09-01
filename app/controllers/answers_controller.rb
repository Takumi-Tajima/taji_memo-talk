class AnswersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[create]
  
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.build(answer_params)
    if @answer.save
      flash[:notice] = "回答が追加されました"
      redirect_back(fallback_location: root_path)
    else
      flash.now[:alert] = "もう一度入力してください"
      render "questions/show", status: :unprocessable_entity
    end
  end
  
  private

  def answer_params
    params.require(:answer).permit(:name, :description)
  end

end
