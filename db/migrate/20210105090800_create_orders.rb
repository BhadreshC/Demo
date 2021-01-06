class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :name
      t.text :address
      t.belongs_to :delivery_boy
      t.timestamps
    end
  end
end
