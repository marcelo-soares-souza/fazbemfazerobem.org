class CreateApoiars < ActiveRecord::Migration[5.0]
  def change
    create_table :apoiars do |t|
      t.references :user, foreign_key: true
      t.references :pedido, foreign_key: true
      t.string :slug

      t.timestamps
    end
    add_index :apoiars, :slug, unique: true
  end
end
