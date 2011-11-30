module Admin::PartnersHelper
  def link_to_add_admin_user(name, f, association)
    new_admin_user = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_admin_user, :child_index=> "new_#{association}") do |builder|
      render("admin_user", :f=>builder, :index=>"new_#{association}", :admin_user=>new_admin_user)
    end
    link_to_function(name, "add_admin_user(this, \"#{association}\", \"#{escape_javascript(fields)}\")".html_safe)
  end
end
