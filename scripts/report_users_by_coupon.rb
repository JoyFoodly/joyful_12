us=User.joins(:coupons).where(coupons: {id: 1})
us.each { |x| puts "#{x.first_name} #{x.last_name}, #{x.email}"}
