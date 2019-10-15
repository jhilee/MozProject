class AddCsvToImporters < ActiveRecord::Migration[6.0]
  def change
    add_column :importers, :csv, :string
  end
end
