class CreateSignatures < ActiveRecord::Migration
  def change
    create_table :signatures do |t|
      t.references :profile, index: true, foreign_key: true
      t.references :yearbook, index: true, foreign_key: true
      t.text :content
      t.string :image
      t.boolean :is_hidden, :default => false
      t.timestamps null: false
    end
    add_index :signatures, [:profile_id, :yearbook_id], unique: true
    add_index :signatures, [:yearbook_id, :created_at]
  end
end
