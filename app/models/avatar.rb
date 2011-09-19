class Avatar < ActiveRecord::Base
  belongs_to :amigo

  has_attached_file :avatar
  has_attached_file :thumb
end
