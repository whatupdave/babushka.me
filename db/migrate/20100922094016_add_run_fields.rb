class AddRunFields < ActiveRecord::Migration
  def self.up
    add_column :runs, :run_at, :datetime
    add_column :runs, :system_info, :string, :limit => 64
  end

  def self.down
    remove_column :runs, :run_at
    remove_column :runs, :system_info
  end
end
