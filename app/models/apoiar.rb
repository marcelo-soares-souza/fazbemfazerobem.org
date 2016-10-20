class Apoiar < ApplicationRecord
  belongs_to :user
  belongs_to :pedido

  extend FriendlyId
  friendly_id :nome_pedido, use: :slugged

  def should_generate_new_friendly_id?
    pedido_id_changed?
  end

  def nome_pedido
    self.pedido.nome_projeto.to_s + "-" + self.user.nome.to_s
  end
end
