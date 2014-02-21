class Media < ActiveRecord::Base
  has_paper_trail
  has_attached_file :file, styles: { thumbnail: '469x' }

  validates :file, attachment_presence: true, attachment_content_type: {
      content_type: %w[image/jpg image/jpeg image/gif image/png]
  }

end
