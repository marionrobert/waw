class Blogpost < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  has_many_attached :photos
  has_rich_text :content
end
