class Pdf < ActiveRecord::Base
  has_attached_file :file

  validates :file, attachment_presence: true, attachment_content_type: { content_type: %w[application/pdf]}
end
