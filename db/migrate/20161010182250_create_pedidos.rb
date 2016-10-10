class CreatePedidos < ActiveRecord::Migration[5.0]
  def change
    create_table :pedidos do |t|
      t.references :projeto, foreign_key: true
      t.string :tipo
      t.text :descricao

      t.timestamps
    end
  end
end
