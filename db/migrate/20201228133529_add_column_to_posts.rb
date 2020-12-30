class AddColumnToPosts < ActiveRecord::Migration[6.0]
  def change
  	add_column :posts, :price, :Interger
  end
end
