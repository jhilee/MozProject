class Importer < ApplicationRecord
  mount_uploader :csv, CsvUploader


end
