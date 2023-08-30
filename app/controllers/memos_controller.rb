class MemosController < ApplicationController

  #current_user の設定
  before_action :set_memo, only: [:show, :edit, :update, :destroy]
  
  def index
    @memos = current_user.memos.all # ここでエラー発生!!(current_userにmemosがないらしいです)
  end
  
  def new
    @memo = current_user.memos.new
  end
  
  def show
  end
  
  def create
    @memo = current_user.memos.new(memo_params)
    if @memo.save!
      redirect_to memo_path(@memo) # 作成したメモの詳細画面へredirect
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def edit
  end
  
  def update
    if @memo.update(memo_params)
      redirect_to memo_path(@memo) # 更新したメモの詳細画面へredirect
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    @memo.destroy! # 失敗した場合は例外を発生(ここで処理が中断)
    redirect_to memos_path
  end
  
  private
  
    # current_user の設定
    def set_memo
      @memo = current_user.memos.find(params[:id])
    end
    
    def memo_params
      params.require(:memo).permit(:title, :description)
    end
  
end