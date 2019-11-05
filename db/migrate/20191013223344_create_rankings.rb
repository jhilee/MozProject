class CreateRankings < ActiveRecord::Migration[6.0]
  def change
    create_table :rankings do |t|
      t.references :keyword,  null: false,foreign_key: true
      t.date :date_ranked, null: false
      t.integer :google
      t.integer :google_base
      t.integer :yahoo
      t.integer :bing
      t.integer :gsv, null: false

      t.timestamps
    end
  end
end
