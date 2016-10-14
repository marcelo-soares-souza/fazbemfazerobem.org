class AddSlugToPedidos < ActiveRecord::Migration[5.0]
  def change
    add_column :pedidos, :slug, :string
    add_index :pedidos, :slug, unique: true
  end
end
