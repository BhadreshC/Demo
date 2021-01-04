class Post < ApplicationRecord
	self.table_name = "posts_detail"
	validates :name, :title, presence: true, uniqueness: true
end
