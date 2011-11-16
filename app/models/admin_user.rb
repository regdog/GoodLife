class AdminUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  belongs_to :partner
  has_many :assignments, :dependent => :destroy
  has_many :roles, :through => :assignments

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :role_ids # :remember_me

  def has_role?(role_sym)
    roles.any? {|r| r.name.underscore.to_sym == role_sym}
  end
end
