class Historial < ActiveRecord::Base
  belongs_to :amistad

  has_attached_file :platica
end
