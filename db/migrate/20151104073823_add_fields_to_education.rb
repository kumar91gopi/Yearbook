class AddFieldsToEducation < ActiveRecord::Migration
  def change
    add_column :educations, :from, :integer
    add_column :educations, :to, :integer
  end
end
