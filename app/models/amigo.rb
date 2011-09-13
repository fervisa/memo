class Amigo < ActiveRecord::Base
  belongs_to :skin
  belongs_to :usuario

  has_many :avatars
  has_many :amistads
end
