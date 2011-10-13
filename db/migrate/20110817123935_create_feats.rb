class CreateFeats < ActiveRecord::Migration
  def self.up
    create_table :feats do |t|
      t.references    :category
      t.string        :name, :limit => 30, :null => false
      t.string        :description, :limit => 200
      t.text          :why
      t.text          :how
      t.integer       :bonus_points, :limit => 3, :default => 0
      t.integer       :checkin_count, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :feats
  end
end
