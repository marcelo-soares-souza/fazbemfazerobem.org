class AddAttachmentImagemToProjetos < ActiveRecord::Migration
  def self.up
    change_table :projetos do |t|
      t.attachment :imagem
    end
  end

  def self.down
    remove_attachment :projetos, :imagem
  end
end
