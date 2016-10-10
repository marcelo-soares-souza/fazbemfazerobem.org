class Projeto < ApplicationRecord
  belongs_to :entidade
  has_many :pedidos

  has_attached_file :imagem, styles: { medium: "580x360>", thumb: "150x150>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :imagem, content_type: /\Aimage\/.*\z/

  validates :nome, :presence => true, length: { minimum: 4 }
  validates :descricao, :presence => true, length: { minimum: 8 }
  validates :imagem, :presence => true
end
