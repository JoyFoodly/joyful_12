class User < ActiveRecord::Base
  has_paper_trail
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :shipping_addresses, dependent: :destroy
  has_many :billing_addresses,  dependent: :destroy
  has_many :subscriptions,      dependent: :destroy
  has_many :family_members,     dependent: :destroy
  has_many :shopping_lists,     dependent: :destroy
  has_many :payments,           dependent: :destroy
  belongs_to :season

  before_validation :set_default_username, on: :create

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validate :beta_user_limit, on: :create

  accepts_nested_attributes_for :family_members, allow_destroy: true

  def full_name
    "#{first_name} #{last_name}"
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
    errors.add(:base, I18n.t('beta.user_limit_hit')) if User.where.not(payment_gateway_customer_id: '').count >= 50
  end

end
