class Admin < ActiveRecord::Base
  has_paper_trail
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
end
