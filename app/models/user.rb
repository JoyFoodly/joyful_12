class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable

  attr_accessor :coupon_id
  
  has_many :shipping_addresses, dependent: :destroy
  has_many :billing_addresses,  dependent: :destroy
  has_many :subscriptions,      dependent: :destroy
  has_many :family_members,     dependent: :destroy
  has_many :shopping_lists,     dependent: :destroy
  has_many :payments,           dependent: :destroy
  has_many :view_records,       dependent: :destroy
  
  has_many :coupon_uses, dependent: :destroy
  has_many :coupons, through: :coupon_uses

  belongs_to :partner
  belongs_to :season
  has_and_belongs_to_many :seasons

  before_validation :set_default_username, on: :create
  before_create :add_seasons

  validates :username, presence: true, uniqueness: true
  validates :first_name, presence: true, length: { maximum: 35 }
  validates :last_name, presence: true, length: { maximum: 35 }
  validate :beta_user_limit, on: :create

  after_commit :add_to_mailing_list

  accepts_nested_attributes_for :family_members, allow_destroy: true
  accepts_nested_attributes_for :shipping_addresses
  
  def full_name
    "#{first_name} #{last_name}"
  end

  def full_member?
    seasons.count == 4
  end

  def season_member?
    seasons.count == 1
  end

  def gift_recipient?
    gift_giver_name.present?
  end

  def track_view(page_title, page_info)
    # Helper function to add a view record for analytics
    v=ViewRecord.new(page_title: page_title, page_info: page_info)
    v.user = self
    v.save
  end

private

  def set_default_username
    self.username = generated_username if username.blank?
  end

  def generated_username
    if User.where(username: username_from_names).exists?
      generate_random_username
    else
      username_from_names
    end
  end

  def username_from_names
    "#{first_name}_#{last_name}".gsub(/\W/, '_').downcase
  end

  def generate_random_username
    loop do
      username = username_from_names + "_#{rand(1000)}"
      break username unless User.where(username: username).exists?
    end
  end

  def beta_user_limit
    if payment_gateway_customer_id.present? && User.where.not(payment_gateway_customer_id: '').count >= 42
      errors.add(:base, I18n.t('beta.user_limit_hit'))
    end
  end

  def add_seasons
    seasons << Season.all
  end

  def add_to_mailing_list
    Gibbon::API.lists.subscribe({
      id: ENV['MAILING_LIST_ID'],
      email: { email: email },
      merge_vars: {
        FNAME: first_name,
        LNAME: last_name,
        SIGNED_UP: created_at,
      },
      double_optin: false,
      update_existing: true,
    })
  rescue
    nil
  end

protected

  def confirmation_required?
    false
  end
end
