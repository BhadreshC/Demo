class RemoveColumnToPosts < ActiveRecord::Migration[6.0]
  def change
  	remove_column :posts, :price, :Integer
  end
end
