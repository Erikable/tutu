class AddColumnToTrains < ActiveRecord::Migration[5.1]
  def change
    add_column :trains, :flag, :boolean
  end
end
