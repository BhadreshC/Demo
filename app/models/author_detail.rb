class AuthorDetail < ApplicationRecord
  belongs_to :author, autosave: true
end
