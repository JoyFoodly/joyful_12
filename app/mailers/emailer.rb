class Emailer < ActionMailer::Base
  default from: "hollie@joyfoodly.com"

  def shopping_list(user, shopping_list)
    @user = user
    @shopping_list = shopping_list
    mail(to: @user.email, subject: "Joyful 12 Shopping List: #{@shopping_list.name}")
  end

end
