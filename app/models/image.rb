class Image < ApplicationRecord
  belongs_to :post, optional: true
  mount_uploader :image, ImageUploader
  validates :image, presence: true
end