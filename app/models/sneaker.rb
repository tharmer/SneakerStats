class Sneaker < ActiveRecord::Base
  mount_uploader :image, ImageUploader
end
