module Api
  module Access
    def access_denied! message=nil
      error! message || "Access Denied", 401
    end

    def bad_request! message=nil
      error! message || "Bad Request", 400
    end

    def forbidden_request! message=nil
      error! message || "Forbidden", 403
    end

    def not_found! message=nil
      error! message || "Not Found", 404
    end

    def invalid_request! message
      error! message, 422
    end
  end
end