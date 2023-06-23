class Article < ApplicationRecord
  
  # Associations 
  belongs_to :user
  has_one_attached :image

  # Validations
  validates :title,:body, presence: true
end
