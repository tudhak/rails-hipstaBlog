class Message < ApplicationRecord
  belongs_to :article
  belongs_to :user
  has_many :votes, dependent: :destroy

  validates :content, :date, presence: true
end
