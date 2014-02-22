class Page < ActiveRecord::Base
  validates :body, presence: true
  validates :slug, presence: true
end
