class Role < ActiveRecord::Base
  has_many :assignments, :dependent => :destroy
  has_many :admin_users, :through => :assignments

  attr_accessible :name
end
