class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :position
      t.string :phone
      t.string :email

      t.belongs_to :application, index: true

      t.timestamps
    end
  end
end
