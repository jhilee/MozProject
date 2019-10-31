class Keyword < ApplicationRecord
  belongs_to :site
  has_many :rankings

end
