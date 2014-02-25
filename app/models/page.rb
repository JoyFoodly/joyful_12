class Page < ActiveRecord::Base
  has_paper_trail
  validates :body, presence: true
  validates :slug, presence: true
end
