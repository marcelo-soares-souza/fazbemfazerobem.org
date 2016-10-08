class AddUserToEntidade < ActiveRecord::Migration[5.0]
  def change
    add_reference :entidades, :user, foreign_key: true
  end
end
