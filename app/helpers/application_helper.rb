module ApplicationHelper

  def season_name
    session[:season_name] || Season.current_season_name
  end

  def gravatar_url(email)
    email_digest = Digest::MD5.hexdigest(email)
    default_avatar = image_url('comments/default-user-avatar.png')
    "https://www.gravatar.com/avatar/#{email_digest}?s=200&d=#{default_avatar}"
  end

  def pp_price(price, precision = 2)
    number_to_currency(price/100, precision: precision)
  end

  def comments_sso_script_for(user)
    # create a JSON packet of our data attributes
    data = 	{
        id: user.id,
        username: user.username,
        email: user.email,
        avatar: gravatar_url(user.email),
        #'url' => user.url,
    }.to_json

    # encode the data to base64
    message  = Base64.encode64(data).gsub("\n", "")
    # generate a timestamp for signing the message
    timestamp = Time.current.to_i
    # generate our hmac signature
    sig = OpenSSL::HMAC.hexdigest('sha1', ENV['DISQUS_SECRET_KEY'], '%s %s' % [message, timestamp])

    # return a script tag to insert the sso message

    javascript_tag "var disqus_config = function() {
      this.page.remote_auth_s3 = '#{message} #{sig} #{timestamp}';
      this.page.api_key = '#{ENV['DISQUS_PUBLIC_KEY']}';
      this.sso = {
          name:   'Joyful 12',
          button: '#{image_url('comments/sso-button.png')}',
          icon:   '#{image_url('favicon.ico')}',
          url:    'http://joyful12.com/users/sign_in/',
          logout: 'http://joyful12.com/users/sign_out/',
    };
    }"
  end

end
