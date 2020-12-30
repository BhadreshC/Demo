class RenameColumnNamePosts < ActiveRecord::Migration[6.0]
  def change
  	rename_column :posts_detail, :subscriber, :customer
  end
end
