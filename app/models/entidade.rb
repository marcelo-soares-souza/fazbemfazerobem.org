class Entidade < ApplicationRecord
  belongs_to :user
  belongs_to :tipo
  has_many :projetos
  has_many :pedidos, :through => :projetos

  validates :tipo_id, :presence => true
  validates :nome, :presence => true, :uniqueness => { :case_sensitive => false }, length: { minimum: 4 }
  validates :cnpj, :presence => true, :uniqueness => { :case_sensitive => false }, length: { minimum: 8 }

  extend FriendlyId
  friendly_id :nome, use: :slugged
end
