module ApplicationHelper
  def link_to_start_date(text, href)
    "<a href='#{href}'>#{text}</a>".html_safe
  end
end
