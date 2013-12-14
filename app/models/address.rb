class Address < ActiveRecord::Base
  belongs_to :user

  validates :line_1,   presence: true
  validates :zip_code, presence: true
  validates :city,     presence: true
  validates :state,    presence: true
  validates :country,  presence: true

  def self.build_from_stripe_payment(address_params)
    new(
      line_1: address_params.fetch("stripeBillingAddressLine1"),
      zip_code: address_params.fetch("stripeBillingAddressZip"),
      city: address_params.fetch("stripeBillingAddressCity"),
      state: address_params.fetch("stripeBillingAddressState"),
      country: address_params.fetch("stripeBillingAddressCountry")
    )
  end
end
