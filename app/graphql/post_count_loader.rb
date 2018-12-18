class PostCountLoader < GraphQL::Batch::Loader
  def perform(user_ids)
    sql = "select user_id, count(*) from posts where user_id in (:user_ids) group by user_id"
    query = ActiveRecord::Base.send(:sanitize_sql_array, [sql, { user_ids: user_ids }])
    res = ActiveRecord::Base.connection.query(query)

    res.each do |user_id, count|
      fulfill(user_id.to_i, count.to_i)
    end
    user_ids.each {|id| fulfill(id, 0) unless fulfilled?(id)}
  end
end
