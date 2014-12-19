class HomePageFeature < ActiveRecord::Base
  belongs_to :coupon
  
  def self.get_feature(k)
    return nil unless k.is_a? Symbol or k.is_a? String

    if (h=HomePageFeature.find_by_key(k))
      return h.content
    else
      return nil
    end
  end

  def self.get_feature_switched(k, session)
    return nil unless k.is_a? Symbol or k.is_a? String

    if !session[:partner_id] or !(switched_fs=HomePageFeature.joins(:coupon).where(coupons: {shareable_tag: session[:partner_id]}))
      return self.get_feature(k)
    end

    f = switched_fs.where(key: k).first

    if f.nil? # Oops, we forgot to set up a home page feature for this coupon with this key
      return self.get_feature(k)
    end
    f.content
  end
end
