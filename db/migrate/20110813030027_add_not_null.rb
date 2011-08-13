class AddNotNull < ActiveRecord::Migration
  def self.up
    {
      'deps' => %w[created_at updated_at],
      'runs' => %w[created_at updated_at run_at system_info],
      'sources' => %w[created_at updated_at]
    }.each_pair {|table, columns|
      columns.each {|column|
        execute %Q{
          ALTER TABLE #{table} ALTER COLUMN #{column} SET NOT NULL
        }
      }
    }
  end
end
