class CreateComments < ActiveRecord::Migration[6.0]
  def change
	  create_table :comments do |t|
	  	t.string :title
	  	t.string :user_name
	  	t.text :description
	  	t.string :likes, null: false
      t.timestamps
    end
  end
end
