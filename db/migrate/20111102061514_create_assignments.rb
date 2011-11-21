class CreateAssignments < ActiveRecord::Migration
  def self.up
    create_table :assignments do |t|
      t.references :admin_user
      t.references :role

      t.timestamps
    end
    add_index :assignments, [:admin_user_id, :role_id], :unique => true
  end

  def self.down
    drop_table :assignments
  end
end
