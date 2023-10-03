class RoomsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show]
  def show
    @room = Room.find(params[:id])
    @comment = Comment.new
  end
end
