class ApplicationController < ActionController::Base
  layout :layout_by_resource
  protect_from_forgery
  before_filter :load_corp_pages

  #def find_my_team
  #  if current_user
  #    @my_team = current_user.load_team_members
  #  end
  #end

  def current_ability
    @current_ability ||= Ability.new(current_admin_user)
  end

  protected

  def layout_by_resource
    if devise_controller?
      "welcome"
    else
      "application"
    end
  end
  
  def load_corp_pages
    category = Tag.find_by_name("Page")
    unless category.nil?
      @pages = category.contents
    end
  end
  
  private
  
  def after_sign_out_path_for(resource_name)
     if resource_name == :admin_user
       admin_root_path
     else
       super
     end
  end

  def after_sign_in_path_for(resource)
       if resource.is_a?(AdminUser)
         admin_root_path
       else
         super
       end
  end
end
