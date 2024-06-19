class CreateMissions < ActiveRecord::Migration[7.1]
  def change
    create_table :missions do |t|
      t.references :listing, null: false, foreign_key: true
      t.date :date, null: false
      t.integer :price
      t.integer :mission_type, default: 0, null: false, index: true

      t.timestamps
    end
  end
end
