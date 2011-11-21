class Admin::BaseController < ApplicationController
  layout 'admin'

  before_filter :authenticate_admin_user!

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to admin_root_url, :alert => exception.message
  end

  #before_filter :ssl_required
  #
  ## Check permissions for everything on the admin side.
  #before_filter :login_required, :except => [:login]
  #before_filter :check_authorization, :except => [:login, :index]
end
