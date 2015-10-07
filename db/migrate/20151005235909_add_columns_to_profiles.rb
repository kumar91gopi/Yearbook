class AddColumnsToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :remote_profile_pic, :string
  end
end
