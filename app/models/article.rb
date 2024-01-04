class Article < ApplicationRecord
  belongs_to :user
  has_many :messages, dependent: :destroy
  has_one_attached :photo, dependent: :destroy

  validates :title, presence: true, length: { minimum: 10 }
  validates :content, :date, presence: true
  validates :rates, presence: true
end
