class Blog < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  mount_uploader :image, ImageUploader
end
