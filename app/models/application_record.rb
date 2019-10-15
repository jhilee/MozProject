class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.import(file)

  end
end
