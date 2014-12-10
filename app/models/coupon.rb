class Coupon < ActiveRecord::Base
  validates :description, :shareable_tag, presence: true

  validate :tag_is_shareable
  before_save :add_shareable_link

  def add_shareable_link

    self.tag_signed = ActiveSupport::MessageVerifier.new(Joyfoodly::Application.config.secret_key_base).generate(shareable_tag)
    self.shareable_link = invite_link
  end
  
  def invite_link
    'http://www.joyful12.com/?tid=' + self.tag_signed
  end

  def tag_is_shareable
    puts ">>> Validating #{shareable_tag}"
    errors.add(:shareable_tag, 'Must be alphanumeric (_ and . allowed)') unless /^\s*[A-Za-z0-9_.]+\s*$/.match(shareable_tag)
  end
end
