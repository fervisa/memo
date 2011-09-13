class Avatar < ActiveRecord::Base
  belongs_to :amigo

  has_attached_file :avatar
end
