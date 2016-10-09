class CreateProjetos < ActiveRecord::Migration[5.0]
  def change
    create_table :projetos do |t|
      t.string :nome
      t.text :descricao
      t.references :entidade, foreign_key: true

      t.timestamps
    end
  end
end
