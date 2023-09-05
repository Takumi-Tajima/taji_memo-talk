class CommentsController < ApplicationController
  
  def create
    @room = Room.find(params[:room_id])
    @comment = @room.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:notice] = "コメントが追加されました"
      redirect_to room_path(@room)
    else
      flash.now[:alert] = "もう一度入力してください"
      render "rooms/show", status: :unprocessable_entity
    end
  end
  
  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end

