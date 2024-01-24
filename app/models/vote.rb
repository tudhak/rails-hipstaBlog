class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :message

  validates :rating, presence: true, numericality: true
end
