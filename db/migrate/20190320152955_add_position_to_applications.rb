class AddPositionToApplications < ActiveRecord::Migration[5.2]
  def change
    rename_column :applications, :position, :jobtitle
    add_column :applications, :position, :integer
  end
end
