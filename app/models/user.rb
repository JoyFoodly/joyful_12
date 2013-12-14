class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :addresses
  has_many :subscriptions

  validates :first_name, presence: true
  validates :last_name, presence: true

  def self.build_from_stripe_payment(user_params)
    new(
      email: user_params.fetch('stripeEmail'),
      first_name: user_params.fetch('stripeBillingName').split.first,
      last_name: user_params.fetch('stripeBillingName').split[1..-1].try(:join, ' '),
      password: Devise.friendly_token[0,20]
    )
  end

end
