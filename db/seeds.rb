# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

u1 = Usuario.create :email => 'usuario1@mail.com', :password => 'abc123', 
    :amigo_attributes => {:nombre => 'Mario', :apellido => 'Alcazar', :activo => 1}

u2 = Usuario.create :email => 'usuario2@mail.com', :password => 'abc123', 
    :amigo_attributes => {:nombre => 'Jaime', :apellido => 'López', :activo => 1}

u1.save
u2.save

ami1 = Amistad.create :amigo => u1.amigo, :amigo_destino => u2.amigo
ami1.save

ami2 = Amistad.create :amigo => u2.amigo, :amigo_destino => u1.amigo
ami2.save