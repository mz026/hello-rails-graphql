class AssociationCountLoader < GraphQL::Batch::Loader
  def initialize association_table_name, foreign_key
    @association_table_name = association_table_name
    @foreign_key = foreign_key
  end

  def perform(keys)
    sql = "select #{@foreign_key}, count(*) from #{@association_table_name} where #{@foreign_key} in (:keys) group by #{@foreign_key}"
    query = ActiveRecord::Base.send(
      :sanitize_sql_array,
      [sql, {keys: keys}]
    )
    res = ActiveRecord::Base.connection.query(query)

    res.each do |key, count|
      fulfill(key.to_i, count.to_i)
    end
    keys.each {|key| fulfill(key, 0) unless fulfilled?(key)}
  end
end

