class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.text :content

      t.belongs_to :application, index: true

      t.timestamps
    end
  end
end
