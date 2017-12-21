class ChangeColumnTrains < ActiveRecord::Migration[5.1]
  def change
    rename_column :trains, :flag, :sort_from_head
  end
end
