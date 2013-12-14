class Food < ActiveRecord::Base
  has_paper_trail
  has_many :cooking_methods, dependent: :destroy

  validates :name, presence: true
  validates :slug, presence: true

  def to_param
    slug
  end

end
