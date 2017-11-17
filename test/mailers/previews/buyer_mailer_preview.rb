class BuyerMailerPreview < ActionMailer::Preview
  def thanks
    order  = Order.first
    BuyerMailer.thanks(order)
  end
end
