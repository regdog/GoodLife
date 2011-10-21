class User::RegistrationsController < Devise::RegistrationsController
  def my_checkins
    @checkins = current_user.latest_checkins
    #GET /users/registrations/my_checkins
    render_with_scope :my_checkins
  end
end
