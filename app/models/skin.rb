class Skin < ActiveRecord::Base
  has_many :amigos

  has_attached_file :cabecera
  has_attached_file :fondo
end
