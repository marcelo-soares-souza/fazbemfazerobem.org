class Pedido < ApplicationRecord
  belongs_to :projeto

  validates :tipo, :presence => true
  validates :descricao, :presence => true, length: { minimum: 4 }

  extend FriendlyId
  friendly_id :nome_projeto, use: :slugged

  def should_generate_new_friendly_id?
    projeto_id_changed?
  end

  def nome_projeto
    self.projeto.entidade.nome.to_s + "-" + self.projeto.nome.to_s + "-" + self.id.to_s
  end

  def apoiar
    self.tipo + " do(a) " + self.projeto.entidade.nome + " do(a) " + self.projeto.nome
  end
end
