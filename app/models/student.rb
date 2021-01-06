class Student < ApplicationRecord
  has_and_belongs_to_many :teachers, join_table: 'teachers_students'
end
