class RemoveFieldsFromEducation < ActiveRecord::Migration
  def change
    remove_column :educations, :from, :date
    remove_column :educations, :to, :date
  end
end
