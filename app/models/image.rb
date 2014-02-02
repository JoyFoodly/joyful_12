class Image < ActiveRecord::Base
  has_paper_trail
  has_attached_file :file, styles: { thumbnail: '469x' }
  belongs_to :imageable, polymorphic: true

  validates :name,       presence: true
  validates :imageable,  presence: true
  validates :sort_order, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :file, attachment_presence: true, attachment_content_type: {
    content_type: %w[image/jpg image/jpeg image/gif image/png]
  }



end
