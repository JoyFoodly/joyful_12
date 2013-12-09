class CookingMethod < ActiveRecord::Base
  has_paper_trail
  belongs_to :food

  validates :name, presence: true
  validates :instructions, presence: true
end
