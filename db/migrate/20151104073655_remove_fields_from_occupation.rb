class RemoveFieldsFromOccupation < ActiveRecord::Migration
  def change
    remove_column :occupations, :from, :date
    remove_column :occupations, :to, :date
  end
end
