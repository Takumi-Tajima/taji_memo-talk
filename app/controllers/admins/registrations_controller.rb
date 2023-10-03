class Admins::RegistrationsController < Devise::RegistrationsController
  layout 'admin/application'

  before_action :redirect_new_action, only: [:new]

  def redirect_new_action
    redirect_to new_admin_session_path, alert: '新しいユーザーの登録は無効です'
  end

  private

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def after_update_path_for(_resource)
    edit_admin_registration_path
  end
end
