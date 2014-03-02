class WaitList < ActiveRecord::Base
  has_paper_trail
  validates :first_name, presence: true
  validates :last_name,  presence: true
  validates :email,      presence: true
end
