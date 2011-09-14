# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)
skin1 = Skin.create :margen => '#c3d2de'
skin1.cabecera = open "#{Rails.root}/public/skin1/cabecera.png"
skin1.fondo = open "#{Rails.root}/public/skin1/fondo.png"
skin1.save

skin2 = Skin.create :margen => '#fbcce8'
skin2.cabecera = open "#{Rails.root}/public/skin2/cabecera.png"
skin2.fondo = open "#{Rails.root}/public/skin2/fondo.png"
skin2.save

skin3 = Skin.create :margen => '#c7c1da'
skin3.cabecera = open "#{Rails.root}/public/skin3/cabecera.png"
skin3.fondo = open "#{Rails.root}/public/skin3/fondo.png"
skin3.save

skin4 = Skin.create :margen => '#c4c4c5'
skin4.cabecera = open "#{Rails.root}/public/skin4/cabecera.png"
skin4.fondo = open "#{Rails.root}/public/skin4/fondo.png"
skin4.save

skin5 = Skin.create :margen => '#c3d2de'
skin5.cabecera = open "#{Rails.root}/public/skin5/cabecera.png"
skin5.fondo = open "#{Rails.root}/public/skin5/fondo.png"
skin5.save

skin6 = Skin.create :margen => '#c3d2de'
skin6.cabecera = open "#{Rails.root}/public/skin6/cabecera.png"
skin6.fondo = open "#{Rails.root}/public/skin6/fondo.png"
skin6.save

skin7 = Skin.create :margen => '#c3d2de'
skin7.cabecera = open "#{Rails.root}/public/skin7/cabecera.png"
skin7.fondo = open "#{Rails.root}/public/skin7/fondo.png"
skin7.save

skin8 = Skin.create :margen => '#c3d2de'
skin8.cabecera = open "#{Rails.root}/public/skin8/cabecera.png"
skin8.fondo = open "#{Rails.root}/public/skin8/fondo.png"
skin8.save


u1 = Usuario.create :email => 'usuario1@mail.com', :password => 'abc123', 
    :amigo_attributes => {:nombre => 'Maria', :apellido => 'Alcazar', :activo => 1, :skin => skin2}
u1.save

u2 = Usuario.create :email => 'usuario2@mail.com', :password => 'abc123', 
    :amigo_attributes => {:nombre => 'Jaime', :apellido => 'López', :activo => 1, :skin => skin3}
u2.save

ami1 = Amistad.create :amigo => u1.amigo, :amigo_destino => u2.amigo
ami1.save

ami2 = Amistad.create :amigo => u2.amigo, :amigo_destino => u1.amigo
ami2.save

av1 = Avatar.create :nombre => ':)', :amigo => u1.amigo
av1.avatar = open "#{Rails.root}/public/hola.flv"
av1.save

av2 = Avatar.create :nombre => ':)', :amigo => u2.amigo
av2.avatar = open "#{Rails.root}/public/hola1.flv"
av2.save

