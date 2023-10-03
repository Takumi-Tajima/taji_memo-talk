class QuestionsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_question, only: %i[edit update destroy]
  before_action :authenticate_question_user!, only: %i[edit destroy]

  def index
    @questions = Question.default_order.page(params[:page])
  end

  def myquestions
    @questions = current_user.questions.default_order.page(params[:page])
  end

  def new
    @question = current_user.questions.new
  end

  def show
    @question = Question.find(params[:id])
    @user = User.find(@question.user_id)
    @answer = Answer.new
    @question.search_qiita_and_associate
  end

  def create
    @question = current_user.questions.new(question_params)
    if @question.save
      flash[:notice] = '質問が投稿されました'
      redirect_to question_path(@question)
    else
      flash.now[:alert] = 'もう一度入力してください'
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @question.update(question_params)
      flash[:notice] = '質問が更新されました'
      redirect_to question_path(@question)
    else
      flash.now[:alert] = 'もう一度入力してください'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @question.destroy!
    flash[:notice] = '質問が削除されました'
    redirect_to questions_path
  end

  private

  def set_question
    @question = current_user.question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :description)
  end

  def authenticate_question_user!
    return if @question.user == current_user

    flash[:alert] = '権限がありません'
    redirect_to questions_path
  end
end
