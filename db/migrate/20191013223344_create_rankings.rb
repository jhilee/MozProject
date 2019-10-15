class CreateRankings < ActiveRecord::Migration[6.0]
  def change
    create_table :rankings do |t|
      t.references :keyword, null: false, foreign_key: true
      t.date :date_ranked
      t.integer :google
      t.integer :google_base
      t.integer :yahoo
      t.integer :bing
      t.integer :gsv

      t.timestamps
    end
  end
end
