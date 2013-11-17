class Food < ActiveRecord::Base
  has_many :cooking_methods

  def to_param
    slug
  end

end
