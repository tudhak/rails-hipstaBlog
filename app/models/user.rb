class User < ApplicationRecord
  has_one_attached :photo
  has_many :messages, dependent: :destroy
  has_many :articles, dependent: :destroy


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
