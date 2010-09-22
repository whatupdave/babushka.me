class RenameUrlToUri < ActiveRecord::Migration
  def self.up
    rename_column :sources, :url, :uri
  end

  def self.down
    rename_column :sources, :uri, :url
  end
end
