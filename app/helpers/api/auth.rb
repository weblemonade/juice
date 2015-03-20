module Api 
  module Auth

    def current_app
      # @auth.credentials returns an array of http basic auth [username, password]
      # since we expect a token only, we will read only the first index as the token
      @current_app ||= App.where(access_token: @auth.credentials[0]).first
    end 

    def authenticate!
      @auth ||=  Rack::Auth::Basic::Request.new(request.env)
      access_denied! unless @auth.provided? && @auth.credentials && @auth.credentials[0] && current_app
    end 
  end 

end
