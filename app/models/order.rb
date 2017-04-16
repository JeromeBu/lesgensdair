class Order < ApplicationRecord
  monetize :amount_cents

  validates :first_name, presence: { message: "Veuillez mettre le prénom de la personne qui volera" }
  validates :last_name, presence: { message: "Veuillez mettre le nom de la personne qui volera" }
  validates :email, presence: { message: "Veuillez mettre un email valide" }

end
