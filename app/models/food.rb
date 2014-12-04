class Food < ActiveRecord::Base
  has_many :recipes, dependent: :destroy
  has_and_belongs_to_many :video_links
  belongs_to :season
  has_many :images, foreign_key: :imageable_id, inverse_of: :imageable, as: :imageable
  
  validates :name,       presence: true
  validates :slug,       presence: true
  validates :sort_order, presence: true

  def to_param
    slug
  end

end
