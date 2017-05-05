class Order < ApplicationRecord
  monetize :amount_cents

  validates :first_name, presence: { message: "Veuillez mettre le prénom de la personne qui volera" }
  validates :last_name, presence: { message: "Veuillez mettre le nom de la personne qui volera" }
  validates :email, presence: { message: "Veuillez mettre un email" }
  validates :email, format: {:with => /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, :message => "Veuillez renseigner un email valide" }
  validates :cgv, acceptance: { message: "\n Veuillez confirmer avoir pris connaissance des conditions générales de vente" }
end
