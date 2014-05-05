class CommunitySessionsController < ApplicationController

  def show
    secret = ENV['COMMUNITY_SSO_SECRET']
    sso = SingleSignOn.parse(request.query_string, secret)
    sso.email = current_user.email
    sso.name = current_user.full_name
    sso.username = current_user.username
    sso.external_id = current_user.id
    sso.sso_secret = secret

    redirect_to sso.to_url(ENV['COMMUNITY_SSO_REDIRECT'])
  end

end
