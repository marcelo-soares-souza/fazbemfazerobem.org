class AddAttachmentImagemToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :imagem
    end
  end

  def self.down
    remove_attachment :users, :imagem
  end
end
