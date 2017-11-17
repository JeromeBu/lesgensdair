class Order < ApplicationRecord
  monetize :amount_cents

  validates :first_name, presence: { message: "Veuillez mettre le prénom de la personne qui volera" }
  validates :last_name, presence: { message: "Veuillez mettre le nom de la personne qui volera" }
  validates :email, presence: { message: "Veuillez mettre un email" }
  validates :email, format: {:with => /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, :message => "Veuillez renseigner un email valide" }
  validates :cgv, acceptance: { message: "\n Veuillez confirmer avoir pris connaissance des conditions générales de vente" }
end

def creation_bon
  html = make_custom_html
  kit = PDFKit.new(html, :page_size => 'Letter')
  kit.stylesheets << '/app/assets/stylesheets/pages/style-bon.css'
  file = kit.to_file('/tmp')
end

private

def make_custom_html
#<link  rel='stylesheet' href='./style-bon.css'/>
"<!DOCTYPE html>
<html>
  <head>
    <title>Bon Cadeau</title>
  </head>
  <body>
    <div id='sheet'>
      <div id='img-zone'>
        <h1>Bon Cadeau</h1>
        <h2>Pour : #{self.first_name} #{self.last_name}</h2>
      </div>
      <div id='green-rectangle'>
      </div>
      <div id='logo'></div>
    </div>
  </body>
</html>"
end
