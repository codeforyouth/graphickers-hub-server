class GraphickersController < ApplicationController
  before_action :authenticate, only: [:update, :destroy, :avatar]
  before_action :set_graphicker, only: [:show, :update, :destroy, :avatar, :portfolios]

  # GET /graphickers
  def index
    @graphickers = Graphicker.all

    render json: @graphickers, methods: [:avatar_url]
  end

  # GET /graphickers/1
  def show
    render json: @graphicker, methods: [:avatar_url]
  end

  # POST /graphickers
  def create
    @graphicker = Graphicker.new(graphicker_params)

    if @graphicker.save
      render json: @graphicker, status: :created, location: @graphicker
    else
      render json: @graphicker.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /graphickers/1
  def update
    if @graphicker.update(graphicker_params)
      render json: @graphicker, methods: [:avatar_url]
    else
      render json: @graphicker.errors, status: :unprocessable_entity
    end
  end

  # DELETE /graphickers/1
  def destroy
    @graphicker.destroy
  end

  # PUT /graphickers/1/avatar
  def avatar
    @graphicker.avatar.attach(params[:avatar])
    render json: @graphicker.avatar_url
  end

  # GET /graphickers/1/portfolios
  def portfolios
    render json: @graphicker.portfolio, methods: [:avatars_url]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_graphicker
      @graphicker = Graphicker.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def graphicker_params
      params.require(:graphicker).permit(:name, :email, :introduction, :equipment, :password, :password_confirmation, :token)
    end

    def authenticate
      auth_graphicker = Graphicker.find(params[:id])
      auth_graphicker.authenticate_token(params[:token])
    end
end
