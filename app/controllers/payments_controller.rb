class PaymentsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_order

  def new
  end

  def create
    customer = Stripe::Customer.create(
      source: params[:stripeToken],
      email:  params[:stripeEmail]
    )

    charge = Stripe::Charge.create(
      customer:     customer.id,   # You should store this customer id and re-use it.
      amount:       @order.amount_cents, # or amount_pennies
      description:  "Règlement pour un #{@order.product_name}. Merci pour votre confiance. (Commande numéro #{@order.id})",
      currency:     @order.amount.currency
    )

    @order.update(payment: charge.to_json, state: 'payé')
    redirect_to order_path(@order)

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_order_payment_path(@order)
  end

private

  def set_order
    @order = Order.where(state: 'en attente de paiement').find(params[:order_id])
  end
end
