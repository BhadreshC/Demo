class AddcolumnToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts_detail, :status, :integer
  end
end
