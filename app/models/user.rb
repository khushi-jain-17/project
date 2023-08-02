# frozen_string_literal: true

class User < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :movies, through: :reviews, dependent: :destroy
  has_many :movies, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  enum role: %i[user admin]
end
