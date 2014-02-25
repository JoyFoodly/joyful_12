class Address < ActiveRecord::Base
  has_paper_trail
  belongs_to :user

  validates :line_1,   presence: true
  validates :zip_code, presence: true
  validates :city,     presence: true
  validates :state,    presence: true
  validates :country,  presence: true
  validates :user,     presence: true
end
