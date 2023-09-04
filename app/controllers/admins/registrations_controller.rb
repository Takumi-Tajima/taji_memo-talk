class Admins::RegistrationsController < Devise::RegistrationsController
  layout 'admin/application'
  
  before_action :redirect_new_action, only: [:new]

  def redirect_new_action
    redirect_to new_admin_session_path, alert: "新しいユーザーの登録は無効です"
  end
end
