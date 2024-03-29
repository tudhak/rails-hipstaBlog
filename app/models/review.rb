class Review < ApplicationRecord
  belongs_to :user
  belongs_to :article

  validates :rating, presence: true, numericality: true
end
