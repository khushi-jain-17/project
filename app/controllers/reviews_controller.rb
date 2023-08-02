# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: %i[create edit destroy update]
  before_action :movie_object, only: %i[create edit destroy update]
  before_action :movie_review, only: %i[edit destroy update]

  def create
    @review = @movie.reviews.new(review_params)
    @review.user = current_user
    if @review.save
      redirect_to movie_reviews_path(@movie),
                  notice: 'Thanks for your review!'
    else
      redirect_to movie_reviews_path(@movie),
                  alert: 'Sorry, you have already given a review!'
    end
  end

  def edit
    @review
  end

  def update
    if @review.update(review_params)
      redirect_to @movie,
                  notice: 'Successfully Updated your review!'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @review.destroy
    redirect_to @movie, status: :see_other,
                        notice: 'Successfully Deleted your review!'
  end

  private

  def movie_review
    @review = @movie.reviews.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:star, :body)
  end

  def movie_object
    @movie = Movie.find(params[:movie_id])
  end
end
