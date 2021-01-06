class AddColumnToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :delivery_status, :string, default: "not assign"
    add_column :orders, :customer_name, :string
    add_column :orders, :delivery_reason, :string
  end
end
