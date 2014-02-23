class Recipe < ActiveRecord::Base
  has_paper_trail
  has_many :images, -> { order('sort_order ASC') }, as: :imageable, dependent: :destroy
  has_many :ingredient_list_items
  has_many :ingredients, through: :ingredient_list_items
  has_and_belongs_to_many :shopping_lists
  belongs_to :food

  validates :title,        presence: true
  validates :subtitle,     presence: true
  validates :prep_time,    presence: true
  validates :cook_time,    presence: true
  validates :serving_size, presence: true
  validates :difficulty,   presence: true, inclusion: { in: %w[easy medium advanced] }
  validates :instructions, presence: true
  validates :sort_order,   presence: true
  validates :food,         presence: true

  def slug(separator = '_')
    title.downcase.gsub(/\W/, separator)
  end

end
