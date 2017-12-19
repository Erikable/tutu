class AddInfoToTicket < ActiveRecord::Migration[5.1]
  def change
    add_column :tickets, :first_name, :string
    add_column :tickets, :family_name, :string
    add_column :tickets, :patronymic, :string
    add_column :tickets, :passport, :string
  end
end
