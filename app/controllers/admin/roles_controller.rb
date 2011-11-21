class Admin::RolesController < Admin::BaseController

  load_and_authorize_resource

  def index
    @search = Role.search(params[:search])
    @roles = Role.all
  end

  def new
    @role = Role.new
  end

  def create
    @role = Role.new(params[:role])
     if @role.save
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end

  def edit
    @role = Role.find(params[:id])
    @search = Role.search(params[:search])
  end

  def update
    @search = Role.search(params[:search])
    @role = Role.find(params[:id])

    if @role.update_attributes(params[:role])
       redirect_to :action => "index"
    else
       redirect_to :action => "edit"
    end
  end

  def destroy
    @role = Role.find(params[:id])
    @role.destroy
    redirect_to admin_roles_path
  end

end
