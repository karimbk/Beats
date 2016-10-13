class DeviseAddLastseenableRaver < ActiveRecord::Migration
  def self.up
    add_column :ravers, :last_seen, :datetime
  end
  
  def self.down
    remove_column :ravers, :last_seen
  end
end