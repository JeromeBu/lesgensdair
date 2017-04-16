class OrdersController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :show, :create]

  def index
    @orders = Order.all
  end

  def show
    @order = Order.where(state: 'payé').find(params[:id])
  end

  def create
    @products = Product.all
    @product = Product.find_by(sku: params[:order][:product_sku])
    puts "--------------------------------------------------------"
    p order_params[:video]
    order_params[:video] == "1" ? amount_to_pay = @product.price + Money.new(2000, 'EUR') : amount_to_pay = @product.price
    @order  = Order.create(product_sku: @product.sku, product_name: @product.name, amount: amount_to_pay, state: 'en attente de paiement', first_name: order_params[:first_name], last_name: order_params[:last_name], email: order_params[:email], video: order_params[:video])
    if @order.save
      redirect_to new_order_payment_path(@order)
    else
      render "products/index"
    end

  end

  private

  def order_params
    params.require(:order).permit(:email, :first_name, :last_name, :video, :product_name)
  end
end

