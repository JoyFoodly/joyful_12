class Form < ActiveRecord::Base
  has_attached_file :photo
  validates :photo, attachment_presence: false, attachment_content_type: {
    content_type: %w[image/jpg image/jpeg image/gif image/png]
  }
end
