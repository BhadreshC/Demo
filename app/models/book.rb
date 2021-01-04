class Book < ApplicationRecord
  belongs_to :author, counter_cache: true
  has_one :author_detail, through: :author
  # belongs_to :writer, class_name: 'Author', foreign_key: 'author_id' #each record access b.writer
end