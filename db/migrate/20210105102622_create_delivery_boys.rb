class CreateDeliveryBoys < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_boys do |t|
      t.string :name
      t.string :number
      t.text :address
      t.timestamps
    end
  end
end
