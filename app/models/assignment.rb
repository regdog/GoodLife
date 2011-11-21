class Assignment < ActiveRecord::Base
  belongs_to :admin_user
  belongs_to :role
end
