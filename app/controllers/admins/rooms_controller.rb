class Admins::RoomsController < Admins::ApplicationController
  before_action :set_room, only: %i[show edit update destroy]
  
  def index
    @rooms = Room.default_order
  end

  def new
    @room = Room.new
  end

  def edit
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      flash[:notice] = "スレッドが作成されました"
      redirect_to admins_rooms_path
    else
      flash.now[:alert] = "もう一度入力してください"
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @room.update(room_params)
      flash[:notice] = "スレッドが更新されました"
      redirect_to admins_rooms_path
    else
      flash.now[:alert] = "もう一度入力してください"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @room.destroy!
    flash[:notice] = "スレッドを削除しました"
    redirect_to admins_rooms_path
  end
  
  private
    def set_room
      @room = Room.find(params[:id])
    end
    
    def room_params
      params.require(:room).permit(:name)
    end
end
