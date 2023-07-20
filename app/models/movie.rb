class Movie < ApplicationRecord
  has_many :reviews,dependent: :destroy
  has_many :users,through: :reviews,dependent: :destroy
  belongs_to :user
  belongs_to :category
  #has_one_attached :image
  validates :name, presence: true
  validates :released_on,presence: true
end
