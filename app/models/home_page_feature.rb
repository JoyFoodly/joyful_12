class HomePageFeature < ActiveRecord::Base
  belongs_to :coupon
  
  def self.get_feature(k)
    return nil unless k.is_a? Symbol or k.is_a? String

    # Need to use the key that's not assigned to any coupon
    fs=HomePageFeature.where(key: k)
    if fs
      nil_fs=fs.where(coupon_id: nil)
      if nil_fs.size>0
        return nil_fs[0].content
      end
    end
    return nil
  end

  def self.get_feature_switched(k, session)
    return nil unless k.is_a? Symbol or k.is_a? String

    if !session[:partner_id] or !(switched_fs=HomePageFeature.joins(:coupon).where(coupons: {shareable_tag: session[:partner_id].downcase}))
      return self.get_feature(k)
    end

    f = switched_fs.where(key: k).first

    if f.nil? # Oops, we forgot to set up a home page feature for this coupon with this key
      return self.get_feature(k)
    end
    f.content
  end
end
