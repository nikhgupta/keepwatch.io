class ApplicationController < ActionController::Base
  include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  set_current_tenant_through_filter

  before_filter :find_tenant

  def find_tenant
    set_current_tenant(current_user)
  end
end
