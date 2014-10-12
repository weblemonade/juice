module V1
  class Example < Base

    namespace :example do

      # authenticate
      before { authenticate! }

      # GET /api/v1/example/
      desc "get a list of items"
      get do
        {message: 'returns a list of items '}
      end

      # GET /api/v1/example/:id
      desc "get a specific item"
      get :id do
        {message: "returns a specific item with id == #{params[:id]}"}
      end

      # POST /api/v1/example/
      desc "create a new item"
      post do
        {message: 'created a new item'}
      end

      # POST /api/v1/example/:id
      desc "updates an existing item"
      put :id do
        {message: "updates item with id == #{params[:id]}"}
      end

    end

  end
end
