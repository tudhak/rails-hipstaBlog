class Article < ApplicationRecord
  belongs_to :user
  has_many :messages
  has_one_attached :photo

  validates :title, presence: true, length: { minimum: 10 }
  validates :content, :date, presence: true
  validates :rating, presence: true, numericality: true
end
