class Addcolumnstousers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :is_admin, :boolean
    add_column :users, :country, :string
    add_column :users, :full_name, :string
  end
end
