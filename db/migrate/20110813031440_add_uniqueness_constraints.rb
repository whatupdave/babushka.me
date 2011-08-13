class AddUniquenessConstraints < ActiveRecord::Migration
  def self.up
    execute <<-SQL
      CREATE UNIQUE INDEX deps_unique_source_id_name ON deps (source_id, name)
    SQL

    # For some reason, conversation's source was duplicated:
    # 526 | git://github.com/conversation/babushka-deps.git      | 2011-03-16 03:50:54.331138 | 2011-03-16 03:50:54.331138
    # 547 | git://github.com/conversation/babushka-deps.git      | 2011-08-13 02:18:48.931371 | 2011-08-13 02:18:48.931371
    execute "UPDATE runs SET dep_id = 3470 WHERE dep_id = 3617"
    execute "DELETE FROM deps WHERE id = 3617"
    execute "DELETE FROM sources WHERE id = 547"

    execute <<-SQL
      CREATE UNIQUE INDEX sources_unique_uri ON sources (uri)
    SQL
  end
end
