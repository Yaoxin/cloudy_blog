require 'carrierwave/orm/activerecord'

class Photo < ApplicationRecord
  mount_uploader :image, ImageUploader
end
