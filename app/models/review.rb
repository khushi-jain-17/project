class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  validates :user_id,uniqueness: {scope: :movie_id}

  private
  
  def update_movie_average_rating
    movie.update_average_rating
  end
end


