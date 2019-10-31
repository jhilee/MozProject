module RankingsHelper
  def add_date_specific_export(href,start_date,end_date)
    "<a href='#{href}' start_date='#{start_date}' end_date='#{end_date}'>Export Selected Data</a>".html_safe

  end
end
