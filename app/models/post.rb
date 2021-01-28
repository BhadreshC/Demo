class Post < ApplicationRecord
  self.table_name = "posts_detail"
  enum status: [ :active, :archived ]
  # validates :name, exclusion: { in: %w(www us ca jp), message: "%{value} is reserved." }
  # validates :name, :title, presence: { message: "Hello" }
  validates :title, confirmation: { case_sensitive: false, message: "not match"}
  validates :title_confirmation, presence: true
  # validates :content, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  # validates :name, inclusion: { in: %w(post postname post_), message: "%{value} is not a valid name" }
  # validates_presence_of :name_confirmation, if: :name_changed?
  # validates :name, length: { is: 2 }
  # validates :name, length: { maximum: 2, message: "%{count} characters is the maximum allowed" }
  # validates :name, numericality: {less_than: 4, greate_than:2}
  # validates :password, length: { in: 6..20 }
  # validates :name, uniqueness: { scope: :year, message: "should happen once per year" }
  # validate :bhadresh
  # validates :name, inclusion: { in: %w(bhadresh medium large), message: "%{value} is not a valid size" }
  # validates_each :name, :title do |record, attr, value|
  #   record.errors.add(attr, 'must start with upper case') if value =~ /\A[[:lower:]]/
  # end
  # def bhadresh
  #   puts "-==================="
  #   puts "-==================="
  #   if name.blank?
  #     errors.add(:name, " should be ")
  #   end
  #   puts "-==================="
  #   puts "-==================="
  # end
  # validate do |post|
  #   errors.add :base, :invalid, message: "This person is invalid because ..." if post.archived?
  # end
  # after_touch :touch_method #this method will work when object.touch call

  # after_find do |obj|
  #   puts obj.object_id
  #   puts obj.as_json
  #   if obj.active?
  #     obj.send_notification
  #     # obj.toggle!(:customer)
  #   end
  # end
  # after_initialize do |obj|
  #   puts "The object has been initialized!"
  #   # puts obj.object_id
  # end
  # def send_notification
  #   puts "-=-=-=-=-=-=-"
  #   puts "-=-=-=-=-=-=-"
  #   puts "notification is being send"
  #   puts "-=-=-=-=-=-=-"
  #   puts "-=-=-=-=-=-=-"
  # end
  def touch_method
    puts "-0=00000000000-=-=-0=-=0-=0-=-=-0="
  end
end

