class CreateEntidades < ActiveRecord::Migration[5.0]
  def change
    create_table :entidades do |t|
      t.string :nome
      t.string :cnpj
      t.text :descricao

      t.timestamps
    end
  end
end
