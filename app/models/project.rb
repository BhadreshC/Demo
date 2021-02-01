class Project < ApplicationRecord
  require 'csv'
  has_many :tasks, inverse_of: :project, dependent: :destroy
  accepts_nested_attributes_for :tasks, reject_if: :all_blank, allow_destroy: true
  before_create :set_slug
  has_one_attached :logo
  has_many_attached :images
  # has_many_attached :images do |attachable|
  #   attachable.variant :thumb, resize: "100x100"
  # end
  def self.custom_csv
    puts "-=--=--=-=--=--=-=-="
    puts "-=--=--=-=--=--=-=-="
    puts "-=--=- CUSTOM CSV CALLL-=--=-=-="
    puts "-=--=--=-=--=--=-=-="
    CSV.generate do |csv|
      csv << ["id", "name", "description", "slug"]
      all.each do |project|
        csv << [project.id, project.name, project.description, project.slug]
      end
    end
  end

  def set_slug
    o = [('a'..'z'), ('A'..'Z'),(0..9)].map(&:to_a).flatten
    str = (0..5).map { o[rand(o.length)] }.join
    if self.slug.nil? == true || self.slug.blank? == true || self.slug.class != Integer
      self.slug = str
    end
  end
  def to_param
    slug
  end
end
