class Admins::SessionsController < Devise::SessionsController
def after_sign_in_path_for(resource_or_scope)
    # xxx_path
  # スレッド一覧の画面のパス
  end

  def after_sign_out_path_for(resource_or_scope)
    new_admin_session_path
  end
end
