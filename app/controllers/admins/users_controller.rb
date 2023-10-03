class Admins::UsersController < Admins::ApplicationController
  before_action :set_user, only: %i[edit update destroy]
  # ApplicationContorollerに before_action :authenticate_admin! がすでに記述してある。

  def index
    @users = User.all
  end

  def edit; end

  def update
    if @user.update(user_params)
      flash[:notice] = 'プロフィールが更新されました'
      redirect_to admins_users_path
    else
      flash.now[:alert] = 'もう一度入力してください'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy!
    flash[:notice] = 'ユーザーを削除しました'
    redirect_to admins_users_path
  end

  private

  # @userの中身を定義
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
