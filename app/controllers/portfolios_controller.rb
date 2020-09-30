class PortfoliosController < ApplicationController
  before_action :authenticate, only: [:create, :update, :destroy, :avatar, :delete_avatar]
  before_action :set_portfolio, only: [:show, :update, :destroy, :avatar, :show_avatar, :delete_avatar]

  # GET /portfolios
  def index
    @portfolios = Portfolio.all

    render json: @portfolios
  end

  # GET /portfolios/1
  def show
    render json: @portfolio, methods: [:avatars_url]
  end

  # POST /portfolios
  def create
    @portfolio = Portfolio.new(portfolio_params)

    if @portfolio.save
      render json: @portfolio, status: :created, location: @portfolio
    else
      render json: @portfolio.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /portfolios/1
  def update
    if @portfolio.update(portfolio_params)
      render json: @portfolio
    else
      render json: @portfolio.errors, status: :unprocessable_entity
    end
  end

  # DELETE /portfolios/1
  def destroy
    @portfolio.destroy
  end

  # PUT /portfolios/1/avatar
  def avatar
    @portfolio.avatars.attach(params[:avatar])
  end

  # GET /portfolios/1/avatar/0
  def show_avatar
    render json: @portfolio.avatar_url(params[:avatar_index].to_i)
  end

  # DELETE /portfolios/1/avatar/0
  def delete_avatar
    @portfolio.avatars.attachments[params[:avatar_index].to_i].purge
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portfolio
      @portfolio = Portfolio.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def portfolio_params
      params.require(:portfolio).permit(:graphicker_id, :title, :show, :place, :event_date)
    end

    def authenticate
      auth_graphicker = Graphicker.find(params[:portfolio][:graphicker_id])
      auth_graphicker.authenticate_token(params[:token])
    end
end
