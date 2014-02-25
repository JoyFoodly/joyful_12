class User < ActiveRecord::Base
  has_paper_trail
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :addresses,      dependent: :destroy
  has_many :subscriptions,  dependent: :destroy
  has_many :family_members, dependent: :destroy
  has_many :shopping_lists, dependent: :destroy
  belongs_to :season

  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  accepts_nested_attributes_for :family_members
end
