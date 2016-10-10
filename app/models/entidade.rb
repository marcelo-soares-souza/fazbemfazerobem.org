class Entidade < ApplicationRecord
  belongs_to :user
  has_many :projetos
  has_many :pedidos, :through => :projetos

  validates :nome, :presence => true, :uniqueness => { :case_sensitive => false }, length: { minimum: 4 }
  validates :cnpj, :presence => true, :uniqueness => { :case_sensitive => false }, length: { minimum: 8 }
end
