class AddBatchToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :batch, :integer
  end
end
