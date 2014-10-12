class API < Grape::API
  prefix 'api'
  format :json

  namespace :info do
    get do
      { api: "Web Lemonade - Juice" }
    end
  end

  mount V1::Base
end