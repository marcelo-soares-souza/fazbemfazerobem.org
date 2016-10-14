class AddAttachmentImagemToTipos < ActiveRecord::Migration
  def self.up
    change_table :tipos do |t|
      t.attachment :imagem
    end
  end

  def self.down
    remove_attachment :tipos, :imagem
  end
end
