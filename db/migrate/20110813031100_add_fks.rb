class AddFks < ActiveRecord::Migration
  def self.up
    {
      'deps' => {
        'source_id' => 'sources'
      },
      'runs' => {
        'dep_id' => 'deps'
      }
    }.each_pair {|table,fks|
      fks.each_pair {|fk,referenced|
        execute <<-SQL
          ALTER TABLE #{table}
          ADD CONSTRAINT #{table}_#{fk}_fk FOREIGN KEY (#{fk})
            REFERENCES #{referenced} (id)
            ON DELETE restrict
            ON UPDATE cascade
        SQL
      }
    }
  end
end
