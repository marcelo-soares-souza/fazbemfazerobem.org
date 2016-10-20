class Tipo < ApplicationRecord
  belongs_to :user
  has_many :entidades

  has_attached_file :imagem, styles: { medium: "580x360>", thumb: "150x150>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :imagem, content_type: /\Aimage\/.*\z/

  validates :nome, :presence => true, length: { minimum: 4 }
  validates :descricao, :presence => true, length: { minimum: 8 }
  validates :imagem, :presence => true

  extend FriendlyId
  friendly_id :nome, use: :slugged

  def should_generate_new_friendly_id?
    nome_changed?
  end
end
