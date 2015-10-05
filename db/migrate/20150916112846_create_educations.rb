class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.references :profile, index: true, foreign_key: true
      t.string :institute
      t.string :field
      t.date :from
      t.date :to

      t.timestamps null: false
    end
  end
end
