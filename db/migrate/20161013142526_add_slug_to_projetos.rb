class AddSlugToProjetos < ActiveRecord::Migration[5.0]
  def change
    add_column :projetos, :slug, :string
    add_index :projetos, :slug, unique: true
  end
end
