class Image < ActiveRecord::Base
  has_attached_file :file, styles: { thumbnail: '469x', gallery: '898x' }
  belongs_to :imageable, polymorphic: true

  validates :name,       presence: true
  validates :imageable,  presence: true
  validates :sort_order, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :file, attachment_presence: true, attachment_content_type: {
      content_type: %w[image/jpg image/jpeg image/gif image/png]
  }


  def self.default_image_url
    "http://d3uroln2zt6ogz.cloudfront.net/recipes/images/thumbnail/712c07157bc8ee3838c0bb1c3187e1e385440ab8.jpg?1393118545"
  end
    
end
