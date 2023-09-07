class ReactionsController < ApplicationController
  # before_action :set_room
  before_action :set_comment

  def create 
    @reaction = current_user.reactions.new(comment_id: @comment.id)
    @reaction.save
    redirect_back(fallback_location: root_path) # コメントの詳細ページにリダイレクトする場合、room_path(@room)ではなくredirect_backを使用
  end

  def destroy
    @reaction = current_user.reactions.find_by(comment_id: @comment.id)
    @reaction.destroy if @reaction # リアクションが存在する場合のみ削除
    redirect_back(fallback_location: root_path) # 同様にredirect_backを使用
  end

private

  def set_comment
   @comment = Comment.find(params[:comment_id])
  end
  
  # def set_room
  # @room = Room.find(params[:comment_id])
  # end	
  
end
