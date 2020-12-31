class Blog < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
  validates :title, presence: true
  validates :content, presence: true
  mount_uploader :image, ImageUploader
end
