class CreateAuthorDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :author_details do |t|
    	t.integer :age
  		t.string :city
    	t.string :mobileno
      t.timestamps
    end
  end
end
