class Ranking < ApplicationRecord
  belongs_to :keyword

  def self.graph_rankings(keyword_id,engine)
    find_by_sql(<<-SQL
    SELECT date_ranked,
           #{engine}
    FROM rankings
    WHERE keyword_id = #{keyword_id}
    SQL
    ).map do |row|
      [
          row['date_ranked'],
          row[engine]
      ]
    end
  end

  def self.find_gsv(keyword_id)
    find_by_sql(<<-SQL
    SELECT date_ranked,
           gsv
    FROM rankings
    WHERE keyword_id = #{keyword_id}
    SQL
    ).map do |row|
      [
          row['date_ranked'],
          row['gsv']
      ]
    end
  end

end