class Ranking < ApplicationRecord
  belongs_to :keyword

  def self.extract_data(data,column)
    extracted = []
    data.each do |row|
       extracted << [row.date_ranked.strftime("%Y-%m-%d"), row[column]]
    end

    return extracted

  end
  def self.get_max_gsv(keyword_id)
    max_gsv ={}
    find_by_sql(<<-SQL
    SELECT DATE_FORMAT(date_ranked, "%Y%m") as date, max(gsv) as max_gsv 
    FROM rankings 
    WHERE keyword_id = #{keyword_id}
    GROUP BY DATE_FORMAT(date_ranked, "%Y%m")
    SQL
    ).map do |row|
      max_gsv[:"#{row['date']}"] = row['max_gsv']
    end
    return max_gsv
  end

  # Assumed to return original rank if gsv is 0
  def self.cal_weighted_rank(rank,gsv,max_gsv)
    if rank.nil?
      return nil
    elsif gsv == 0
      return rank
    else
      return rank * (gsv / max_gsv)
    end
  end

  def self.get_weighted_rank(keyword_id,ranks,gsv)
    max_gsv = get_max_gsv(keyword_id)
    weighted_ranks = []

    i = 0
    until i >= ranks.length
      yearMonth = ranks[i][0][0..6].sub! "-", ""
      month_max = max_gsv[:"#{yearMonth}"] #70

      weighted_rank = cal_weighted_rank(ranks[i][1], gsv[i][1], month_max)
      weighted_ranks << [ranks[i][0],weighted_rank]
      i += 1
    end

    return weighted_ranks
  end

  def self.to_csv
    columns = %w{date_ranked google google_base yahoo bing gsv }
    CSV.generate(headers: true) do |csv|
      csv << columns
      all.each do |result|
        csv << columns.map { |column| result.send(column) }
      end
      end
  end
end