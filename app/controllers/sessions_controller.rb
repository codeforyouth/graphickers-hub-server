class SessionsController < ApplicationController
  def new # login
    login_graphicker = Graphicker.find_by(name: params[:name])

    if login_graphicker == nil
      render json: {error: 'no such graphicker'}, status: :unprocessable_entity
      return
    end
    
    if login_graphicker.authenticate(params[:password])
      render json: login_graphicker
    else
      render json: login_graphicker.errors, status: :unprocessable_entity
    end
  end
end
