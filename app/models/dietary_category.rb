class DietaryCategory < ActiveRecord::Base
  has_paper_trail
  has_attached_file :icon

  has_and_belongs_to_many :recipes

  validates :name,       presence: true
  validates :icon, attachment_presence: true, attachment_content_type: {
    content_type: %w[image/jpg image/jpeg image/gif image/png]
  }
end
