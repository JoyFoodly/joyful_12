class Coupon < ActiveRecord::Base
  acts_as_paranoid

  has_many :coupon_allocations, dependent: :destroy
  has_many :partners, through: :coupon_allocations
  
  validates :description, :shareable_tag, presence: true
  
  validate :tag_is_shareable
  before_save :pre_process_steps
  
  def pre_process_steps
    # Generate a shareable link
    self.tag_signed = ActiveSupport::MessageVerifier.new(Joyfoodly::Application.config.secret_key_base).generate(shareable_tag)
    self.shareable_link = invite_link

    # downcase the coupon's shareable tag
    self.shareable_tag.downcase!
  end
  
  def invite_link
    'http://www.joyful12.com/?tid=' + self.tag_signed
  end

  def gift?
    self.shareable_tag.match(/\Agift/)
  end

  def tag_is_shareable
    errors.add(:shareable_tag, 'Must be alphanumeric (_ and . allowed)') unless /^\s*[A-Za-z0-9_.]+\s*$/.match(shareable_tag)
  end
end
