class CreateOccupations < ActiveRecord::Migration
  def change
    create_table :occupations do |t|
      t.references :profile, index: true, foreign_key: true
      t.string :company
      t.string :position
      t.string :city
      t.date :from
      t.date :to

      t.timestamps null: false
    end
  end
end
