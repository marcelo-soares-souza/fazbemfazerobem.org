class AddSlugToEntidades < ActiveRecord::Migration[5.0]
  def change
    add_column :entidades, :slug, :string
    add_index :entidades, :slug, unique: true
  end
end
