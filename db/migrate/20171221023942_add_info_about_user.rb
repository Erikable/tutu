class AddInfoAboutUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :second_name, :string, limit: 60
  end
end
