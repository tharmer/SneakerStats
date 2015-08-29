class Sneaker < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  
  
  has_many :reviews
    validates :brand, :name, :style, :buy, :image, presence: true
    validates :buy, format: { with: /\Ahttps?:\/\/.*\z/,
      message: "must start with http:// or https://" }
  end
