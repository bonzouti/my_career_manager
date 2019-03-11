class CreateJobOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :job_offers do |t|
      t.string :link
      t.text :description

      t.belongs_to :application, index: true

      t.timestamps
    end
  end
end
