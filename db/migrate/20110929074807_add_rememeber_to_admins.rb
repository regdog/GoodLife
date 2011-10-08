class AddRememeberToAdmins < ActiveRecord::Migration
  def self.up
    change_table(:administrators)do |t|
      t.rememberable
    end
  end

  def self.down
  end
end
