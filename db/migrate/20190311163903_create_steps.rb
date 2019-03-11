class CreateSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :steps do |t|
      t.string :title
      t.string :type
      t.text :description
      t.date :date
      t.boolean :status

      t.belongs_to :application, index: true

      t.timestamps
    end
  end
end
