class AnswersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create]
  
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answer.build(answer_params)
    if @answer.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
    # 解答の送信に成功したか失敗したかを通知する記述をする？
  end
  
  # def new
  #   @awnser = Answer.new
  # end
  
  # def index
  #   @question = Question.find(params[:question_id])
  #   @answers = @question.ansers.all
  # end
  
  private

  def answer_params
    params.require(:answer).permit(:name, :description)
  end

end
