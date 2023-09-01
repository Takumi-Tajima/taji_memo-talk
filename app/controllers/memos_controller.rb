class MemosController < ApplicationController
  before_action :set_memo, only: [:show, :edit, :update, :destroy]
  
  def index
    @memos = current_user.memos.all
  end
  
  def new
    @memo = current_user.memos.new
  end
  
  def show
  end
  
  def create
    @memo = current_user.memos.new(memo_params)
    if @memo.save
      flash[:notice] = "メモが追加されました"
      redirect_to memo_path(@memo)
    else
      flash.now[:alert] = "もう一度入力してください"
      render :new, status: :unprocessable_entity
    end
  end
  
  def edit
  end
  
  def update
    if @memo.update(memo_params)
      flash[:notice] = "メモが更新されました"
      redirect_to memo_path(@memo)
    else
      flash.now[:alert] = "もう一度入力してください"
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    @memo.destroy!
    flash[:notice] = "メモを削除しました" #失敗のflash_messageも必要？
    redirect_to memos_path
  end
  
  private
    def set_memo
      @memo = current_user.memos.find(params[:id])
    end
    
    def memo_params
      params.require(:memo).permit(:title, :description)
    end
end