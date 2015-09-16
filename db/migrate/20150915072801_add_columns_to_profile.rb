class AddColumnsToProfile < ActiveRecord::Migration
  def change
    add_reference :profiles, :school, index: true, foreign_key: true
    add_column :profiles, :gender, :string
  end
end
