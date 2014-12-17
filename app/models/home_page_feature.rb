class HomePageFeature < ActiveRecord::Base
  def self.get_feature(k)
    return nil unless k.is_a? Symbol or k.is_a? String

    if (h=HomePageFeature.find_by_key(k))
      return h.content
    else
      return nil
    end
  end
end
