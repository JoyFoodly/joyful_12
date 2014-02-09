class SessionsController < Devise::SessionsController
  skip_before_filter :under_construction
end
