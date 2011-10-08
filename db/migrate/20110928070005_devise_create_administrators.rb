class DeviseCreateAdministrators < ActiveRecord::Migration
  def self.up
    create_table(:administrators) do |t|
      t.database_authenticatable :null => false
      t.string :name, :null => false
      t.recoverable
      t.trackable
      t.timestamps
      
      # t.encryptable
      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :email
      # t.token_authenticatable
    end

    add_index :administrators, :email,                :unique => true
    add_index :administrators, :reset_password_token, :unique => true
    add_index :administrators, :name,                 :unique => true
    # add_index :administrators, :confirmation_token,   :unique => true
    # add_index :administrators, :unlock_token,         :unique => true
    # add_index :administrators, :authentication_token, :unique => true
  end

  def self.down
    drop_table :administrators
  end
end
