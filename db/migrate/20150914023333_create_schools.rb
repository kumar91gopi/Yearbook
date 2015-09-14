class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :school_name
      t.text :address
      t.string :phone_number
      t.string :email

      t.timestamps null: false
    end
  end
end
