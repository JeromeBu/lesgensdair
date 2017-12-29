class BuyerMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.buyer_mailer.thanks.subject
  #
  def thanks(order)
    @order = order

    attachments['bon-parapente.pdf'] = File.read("#{Rails.root.join('tmp')}/bon-parapente.pdf")
    mail to: order.email, subject: "Votre Bon Parapente - Lesgendair"
  end
end

