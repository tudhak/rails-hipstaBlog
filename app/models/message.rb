class Message < ApplicationRecord
  belongs_to :article
  belongs_to :user

  validates :content, :date, presence: true
  validates :rating, presence: true, numericality: true
end
