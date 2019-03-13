class CreateApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :applications do |t|
      t.string :company_name
      t.string :position
      t.string :status
      t.string :joboffer_link
      t.text :joboffer_description
      t.text :notes

      t.belongs_to :user, index: true

      t.timestamps

    end
  end
end
