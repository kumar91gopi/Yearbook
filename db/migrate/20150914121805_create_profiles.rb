class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.references :user, index: true, foreign_key: true
      t.string :name
      t.date :date_of_birth
      t.string :city
      t.text :about_me
      t.integer :user_type, :default => 0

      t.timestamps null: false
    end
  end
end
