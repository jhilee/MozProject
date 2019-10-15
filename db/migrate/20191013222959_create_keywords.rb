class CreateKeywords < ActiveRecord::Migration[6.0]
  def change
    create_table :keywords do |t|
      t.references :site, null: false, foreign_key: true
      t.string :keyword
      t.string :market
      t.integer :device
      t.date :created_at
    end
  end
end
