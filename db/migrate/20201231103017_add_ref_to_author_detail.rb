class AddRefToAuthorDetail < ActiveRecord::Migration[6.0]
  def change
    add_reference :author_details, :author, null: false, foreign_key: true
  end
end
