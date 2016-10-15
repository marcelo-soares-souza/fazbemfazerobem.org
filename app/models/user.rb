class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :nome, :presence => true

  has_many :entidades

  has_attached_file :imagem, styles: { medium: "200x200>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :imagem, content_type: /\Aimage\/.*\z/

  extend FriendlyId
  friendly_id :nome, use: :slugged
      
  def should_generate_new_friendly_id?
    nome_changed?
  end
end
