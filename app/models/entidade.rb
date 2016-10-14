class Entidade < ApplicationRecord
  belongs_to :user
  belongs_to :tipo
  has_many :projetos
  has_many :pedidos, :through => :projetos

  validates :tipo_id, :presence => true
  validates :nome, :presence => true, :uniqueness => { :case_sensitive => false }, length: { minimum: 4 }
  validates :cnpj, :presence => true, :uniqueness => { :case_sensitive => false }, length: { minimum: 8 }

  # Endereço Completo
  validates :logradouro, :presence => true, length: { minimum: 4 }
  validates :cidade, :presence => true, length: { minimum: 2 }
  validates :estado, :presence => true, length: { maximum: 2 }
  validates :cep, :presence => true, length: { minimum: 8 }

  geocoded_by :full_street_address
  after_validation :geocode

  extend FriendlyId
  friendly_id :nome, use: :slugged

  protected

  def full_street_address
    self.logradouro + ", " + self.cidade + ", " + self.estado + ", CEP " + self.cep
  end
end
