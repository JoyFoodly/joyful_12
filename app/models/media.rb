class Media < ActiveRecord::Base
  has_paper_trail
  has_attached_file :file, styles: { thumbnail: '' }, convert_options: {
    thumbnail: '-gravity north -thumbnail 469x312^ -extent 469x312'
  }

  validates :file, attachment_presence: true, attachment_content_type: {
    content_type: %w[image/jpg image/jpeg image/gif image/png]
  }

end
