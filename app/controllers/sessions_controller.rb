class SessionsController < ApplicationController
  def create # login
    login_graphicker = Graphicker.find_by(name: params[:name])

    if login_graphicker == nil
      render json: {error: 'no such graphicker'}, status: :unprocessable_entity
      return
    end
    
    if not login_graphicker.authenticate(params[:password])
      render json: login_graphicker.errors, status: :unprocessable_entity
      return
    end

    token = Graphicker.generate_token
    if login_graphicker.set_token(token)
      render json: login_graphicker.generate_login_output(token)
    else
      render json: login_graphicker.errors, status: :unprocessable_entity
    end
  end

  def destroy # logout
    logout_graphicker = Graphicker.find_by(name: params[:name])

    if logout_graphicker == nil
      render json: {error: 'no such graphicker'}, status: :unprocessable_entity
      return
    end

    if logout_graphicker(params[:token])
      render json: login_graphicker
    else
      render json: login_graphicker.errors, status: :unprocessable_entity
    end

  end
end
