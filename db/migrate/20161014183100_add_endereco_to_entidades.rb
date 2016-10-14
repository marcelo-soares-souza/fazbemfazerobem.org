class AddEnderecoToEntidades < ActiveRecord::Migration[5.0]
  def change
    add_column :entidades, :logradouro, :string
    add_column :entidades, :cidade, :string
    add_column :entidades, :estado, :string
    add_column :entidades, :cep, :string
  end
end
