class Pedido < ApplicationRecord
  belongs_to :projeto

  validates :tipo, :presence => true
  validates :descricao, :presence => true, length: { minimum: 4 }

  extend FriendlyId
  friendly_id :nome_projeto, use: :slugged

  def nome_projeto
    self.projeto.entidade.nome.to_s + "-" + self.projeto.nome.to_s + "-" + self.id.to_s
  end
end
