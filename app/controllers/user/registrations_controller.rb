class User::RegistrationsController < Devise::RegistrationsController
  def my_checkins
    @checkins = current_user.latest_checkins
    render :template=>'users/registrations/my_checkins'
  end
end
