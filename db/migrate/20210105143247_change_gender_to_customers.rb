class ChangeGenderToCustomers < ActiveRecord::Migration[5.2]
  def change
    change_column_null :customers, :gender, :integer, null: false
    change_column_null :customers, :age, :integer, null: false
  end
end
