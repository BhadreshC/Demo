class AddSubscirberToPosts < ActiveRecord::Migration[6.0]
  def change
  	add_column :posts, :subscribers, :boolean, default: false
	add_column :posts, :trial, :boolean, default: true
	add_column :posts, :price, :Integer, default: "50"
  end
end
