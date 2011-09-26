class Historial < ActiveRecord::Base
  belongs_to :amigo

  has_attached_file :platica
end
