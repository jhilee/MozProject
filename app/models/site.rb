class Site < ApplicationRecord
  has_many :keywords

  def show_keywords
    render :partial=>"site/show"
  end
end
