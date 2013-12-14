class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :addresses, dependent: :destroy
  has_many :subscriptions, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
end
