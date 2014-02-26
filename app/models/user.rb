class User < ActiveRecord::Base
  has_paper_trail
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :addresses,      dependent: :destroy
  has_many :subscriptions,  dependent: :destroy
  has_many :family_members, dependent: :destroy
  has_many :shopping_lists, dependent: :destroy
  belongs_to :season

  before_validation :set_default_username, on: :create

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  accepts_nested_attributes_for :family_members

private

  def set_default_username
    self.username = generated_username if username.blank?
  end

  def generated_username
    if User.where(username: username_from_names).exists?
      generate_random_username
    else
      username_from_names
    end
  end

  def username_from_names
    "#{first_name}_#{last_name}".gsub(/\W/, '_').downcase
  end

  def generate_random_username
    loop do
      username = username_from_names + "_#{rand(1000)}"
      break username unless User.where(username: username).exists?
    end
  end

end
