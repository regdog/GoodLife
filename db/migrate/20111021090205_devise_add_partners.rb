class DeviseAddPartners < ActiveRecord::Migration
  def self.up
    change_table(:partners) do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable
      t.confirmable
      t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :email
    end

    add_index :partners, :email,                :unique => true
    add_index :partners, :reset_password_token, :unique => true
    add_index :partners, :confirmation_token,   :unique => true
    add_index :partners, :unlock_token,         :unique => true
    add_index :partners, :name,                 :unique => true
    # add_index :partners, :confirmation_token,   :unique => true
    # add_index :partners, :unlock_token,         :unique => true
    # add_index :partners, :authentication_token, :unique => true
  end

  def self.down
    remove_columns :database_authenticatable, :recoverable, :rememberable, :trackable, :confirmable, :lockable
  end
end
