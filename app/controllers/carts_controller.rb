class CartsController < ApplicationController
  before_action :authenticate_user
  before_action :set_cart, only: [:destroy]
  before_action :carts_user, only: [:index, :destro]

  def index
   # @carts_user = Cart.where(user_id: current_user.id)
    @amount = Cart.amount(@carts_user)
  end

  def create
    @cart = Cart.new(cart_params)
    @cart.activity_id = Activity.find(params[:activity_id]).id
    @cart.user_id = current_user.id

    if @cart.save
      redirect_to activities_path, notice: 'Actitivy added to cart'
    else
      render :new
    end
  end

  def destroy
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to carts_url, notice: 'Actitivy removed from cart' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    def carts_user
      @carts_user = Cart.where(user_id: current_user.id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params.fetch(:cart, {})
    end
end
