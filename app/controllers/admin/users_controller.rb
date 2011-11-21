class Admin::UsersController < Admin::BaseController

  load_and_authorize_resource

  def index
    @search = User.search(params[:search])
  end

end
