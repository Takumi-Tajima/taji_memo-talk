class RoomsController < ApplicationController

  def show
    @room = Room.find(params[:id])
    @comment = Comment.new
  end
  
end
