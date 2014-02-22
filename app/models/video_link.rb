class VideoLink < ActiveRecord::Base
  has_and_belongs_to_many :foods
  validates :name, presence: true
  validates :height, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :width,  numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :provider_id,   presence: true
end
