class Recipe < ActiveRecord::Base
  has_paper_trail
  belongs_to :food

  validates :title,        presence: true
  validates :subtitle,     presence: true
  validates :prep_time,    presence: true
  validates :cook_time,    presence: true
  validates :serving_size, presence: true
  validates :difficulty,   presence: true, inclusion: { in: %w[easy medium advanced] }
  validates :instructions, presence: true
  validates :food, associated: true
end
