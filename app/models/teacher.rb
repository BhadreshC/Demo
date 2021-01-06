class Teacher < ApplicationRecord
  has_and_belongs_to_many :students, join_table: 'teachers_students'
end
