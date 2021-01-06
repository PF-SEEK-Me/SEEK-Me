class RenameTelepheneNumberColumnToCustomers < ActiveRecord::Migration[5.2]
  def change
    rename_column :customers, :telephene_number, :telephone_number
  end
end
