class Keyword < ApplicationRecord
  belongs_to :site
  has_many :rankings

  def render_graph

  end
end
