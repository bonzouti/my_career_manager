class AddCategoryColumnToStep < ActiveRecord::Migration[5.2]
  def change
    rename_column :steps, :type, :category
  end
end
