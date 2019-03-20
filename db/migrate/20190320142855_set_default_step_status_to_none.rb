class SetDefaultStepStatusToNone < ActiveRecord::Migration[5.2]
  def change
    change_column :steps, :status, :boolean, :default => false
  end
end
