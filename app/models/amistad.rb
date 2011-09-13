class Amistad < ActiveRecord::Base
  belongs_to :amigo, :class_name => "Amigo"
  belongs_to :amigo_destino, :class_name => "Amigo"

  has_many :emails
  has_many :historials
end
