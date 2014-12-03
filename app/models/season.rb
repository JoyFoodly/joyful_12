class Season < ActiveRecord::Base
  has_many :foods
  has_and_belongs_to_many :users

  validates :name, presence: true, inclusion: { in: %w[Winter Spring Summer Fall] }

  def self.current_season(season_name = nil)
    find_by!(name: season_name || current_season_name)
  end

  def self.current_season_name
    'Winter'
  end

end
