module V1
  class Base < Grape::API

    version 'v1', :using => :path, :vendor => 'weblemonade', :format => :json

    helpers Api::Auth
    helpers Api::Access

    rescue_from :all do |e|
      Rack::Response.new([ e.message ], 500, { "Content-type" => "application/json" }).finish
    end

    namespace :info do
      get do
        { api: "Web Lemonade - Juice", version: version }
      end
    end

    mount V1::Example

  end
end