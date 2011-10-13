class ApplicationController < ActionController::Base
  layout :layout_by_resource
  protect_from_forgery
  before_filter :load_corp_pages

  #def find_my_team
  #  if current_user
  #    @my_team = current_user.load_team_members
  #  end
  #end

  protected

  def layout_by_resource
    if devise_controller?
      "welcome"
    else
      "application"
    end
  end
  
  def load_corp_pages
    category = Category.find_by_name("Page")
    unless category.nil?
      @pages = category.contents
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
