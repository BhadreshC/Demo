class CreateVarients < ActiveRecord::Migration[6.0]
  def change
    create_table :varients do |t|
      t.string :size
      t.string :color
      t.string :material
      t.references :product
      t.timestamps
    end
  end
end
