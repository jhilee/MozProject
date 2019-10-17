class Importer < ApplicationRecord
  mount_uploader :csv, CsvUploader

  def import (file_path)
    devices = {desktop:1,smartphone:2}
    data = CSV.parse(File.read(file_path), headers: true, col_sep: "\t")

    data.each do |row|
      site_name = row['Site']
      keyword_name = row['Keyword']
      market = row['Market']
      device = devices[:"#{row["Device"]}"]
      date_ranked = row["Date"]
      google = row["Google"]
      google_base =  row["Google Base Rank"]
      yahoo =  row["Yahoo"]
      bing =  row["Bing"]
      gsv =  row["Global Monthly Searches"]

      site = Site.find_by site: site_name

      if site.nil?
        site = Site.create(site: site_name)
      end

      keyword = Keyword.find_by site_id:site.id, keyword:keyword_name,
                                market:market, device:device


      if keyword.nil?
         site.keywords << keyword = Keyword.create(keyword: keyword_name,
                                                   market: market,
                                                   device: device)
       end

      keyword.rankings << Ranking.create(
                                     date_ranked: date_ranked,
                                     google: google,
                                     google_base: google_base,
                                     yahoo: yahoo,
                                     bing: bing,
                                     gsv: gsv
      )
    end
  end

end
