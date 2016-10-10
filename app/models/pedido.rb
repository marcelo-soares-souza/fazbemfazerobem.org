class Pedido < ApplicationRecord
  belongs_to :projeto

  validates :tipo, :presence => true
  validates :descricao, :presence => true, length: { minimum: 4 }
end
