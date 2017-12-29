class Order < ApplicationRecord
  monetize :amount_cents

  validates :first_name, presence: { message: "Veuillez mettre le prénom de la personne qui volera" }
  validates :last_name, presence: { message: "Veuillez mettre le nom de la personne qui volera" }
  validates :email, presence: { message: "Veuillez mettre un email" }
  validates :email, format: {:with => /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, :message => "Veuillez renseigner un email valide" }
  validates :cgv, acceptance: { message: "\n Veuillez confirmer avoir pris connaissance des conditions générales de vente" }

  def creation_bon
    parametres = { first_name: self.first_name,
                    last_name: self.last_name,
                    product_name: self.product_name}
    string_of_param = parametres.reduce("") { |sum,(key,val)| "#{sum}&#{key}=#{val}"}

    if Rails.env == "development"
      html = "http://localhost:3000/bon?#{string_of_param}"
    else
      html = "https://www.secure-lesgensdair.com/bon?#{string_of_param}"
    end
    kit = PDFKit.new(html, :page_size => 'Letter',
                            :margin_top => '0.0in',
                            :margin_right => '0.0in',
                            :margin_bottom => '0.0in',
                            :margin_left => '0.0in',
                            :orientation => 'Landscape')

    file = kit.to_file(Rails.root.join('tmp','bon-parapente.pdf'))
  end
end


