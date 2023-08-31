class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  
  private
  
  def update_resource(resource, params)
    resource.update_without_password(params)
  end
end
