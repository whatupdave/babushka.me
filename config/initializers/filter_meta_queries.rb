if Rails.env == "development"
  ActiveRecord::LogSubscriber.class_eval {
    def sql_with_meta_query_filtering event
      unless [
        'FROM pg_attribute',
        'FROM pg_class'
      ].any? {|exclude| event.payload[:sql][exclude] }
        sql_without_meta_query_filtering event
      end
    end
    alias_method_chain :sql, :meta_query_filtering
  }
end
