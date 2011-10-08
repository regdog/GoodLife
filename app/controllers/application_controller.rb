class ApplicationController < ActionController::Base
  layout :layout_by_resource
  protect_from_forgery
  before_filter :find_my_team

  def find_my_team
    if current_user
      @my_team ||=[]
      @my_team = current_user.friends
      @my_team << current_user
      @my_team = @my_team.sort_by {|m| [m.sign_in_count]}.reverse!
      @my_team.flatten
    end
  end

  protected

  def layout_by_resource
    if devise_controller?
      "welcome"
    else
      "application"
    end
  end
  
  private
  
  def after_sign_out_path_for(resource_name)
    if resource_name == :administrator
      admin_root_path
    else
      super
    end
  end
  
  def after_sign_in_path_for(resource)
      if resource.is_a?(Administrator)
        admin_root_path
      else
        super
      end
  end
end
