class Season < ActiveRecord::Base
  has_paper_trail
  has_many :foods
  has_many :users
  validates :name, presence: true, inclusion: { in: %w[Winter Spring Summer Fall] }

  def self.current_season(user = nil, season_name = nil)
    user.try(:season) || find_by!(name: season_name || current_season_name)
  end

  def self.current_season_name
    day_hash = Date.today.month * 100 + Date.today.mday
    case day_hash
      when 101..401 then 'Winter'
      when 402..630 then 'Spring'
      when 701..930 then 'Summer'
      when 1001..1231 then 'Fall'
    end
  end
end
