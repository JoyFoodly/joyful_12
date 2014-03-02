module ApplicationHelper

  def season_name
    session[:season_name] || Season.current_season_name
  end

  def comments_sso_script_for(user)
    # create a JSON packet of our data attributes
    data = 	{
        id: user.id,
        username: user.username,
        email: user.email
        #'avatar' => user.avatar,
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
          icon:   'http://joyful12.com/#{image_url('favicon.ico')}',
          url:    'http://joyful12.com/users/sign_in/',
          logout: 'http://joyful12.com/users/sign_out/',
    };
    }"
  end

end
