class OrdersController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :show, :create]

  def index
    order = Order.new
    authorize order
    @orders = policy_scope(Order).order(created_at: :desc)
  end

  def show
    @order = Order.where(state: 'payé').find(params[:id])
    authorize @order
  end

  def create
    @products = policy_scope(Product)
    @product = Product.find_by(sku: params[:order][:product_sku])
    order_params[:video] == "1" ? amount_to_pay = @product.price + Money.new(2000, 'EUR') : amount_to_pay = @product.price
    @order  = Order.create(
      product_sku: @product.sku,
      product_name: @product.name,
      amount: amount_to_pay,
      state: 'en attente',
      first_name: order_params[:first_name].capitalize,
      last_name: order_params[:last_name].capitalize,
      email: order_params[:email],
      video: order_params[:video],
      cgv: order_params[:cgv])
    authorize @order
    if @order.save
      redirect_to new_order_payment_path(@order)
    else
      render "products/index"
    end
  end

  private

  def order_params
    params.require(:order).permit(:email, :first_name, :last_name, :video, :product_name, :cgv)
  end
end

