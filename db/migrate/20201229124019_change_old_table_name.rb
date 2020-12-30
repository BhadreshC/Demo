class ChangeOldTableName < ActiveRecord::Migration[6.0]
  def change
  	rename_table :posts, :posts_detail
  end
end
