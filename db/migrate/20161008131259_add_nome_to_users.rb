class AddNomeToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :nome, :string
  end
end
