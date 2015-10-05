class AddProfilePicToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :profile_pic, :string
  end
end
