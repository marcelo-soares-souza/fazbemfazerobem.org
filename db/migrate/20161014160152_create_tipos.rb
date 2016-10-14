class CreateTipos < ActiveRecord::Migration[5.0]
  def change
    create_table :tipos do |t|
      t.string :nome
      t.text :descricao
      t.string :slug
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
