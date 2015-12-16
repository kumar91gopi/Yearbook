class AddFieldsToOccupation < ActiveRecord::Migration
  def change
    add_column :occupations, :from, :integer
    add_column :occupations, :to, :integer
  end
end
