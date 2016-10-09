class Entidade < ApplicationRecord
  belongs_to :user

  validates :nome, :presence => true, :uniqueness => { :case_sensitive => false }, length: { minimum: 3 }
  validates :cnpj, :presence => true, :uniqueness => { :case_sensitive => false }, length: { minimum: 5 }
end
