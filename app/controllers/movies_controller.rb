# frozen_string_literal: true

class MoviesController < ApplicationController
  before_action :authenticate_user!, only: %i[create edit destroy update]
  before_action :movie_object, only: %i[show edit destroy update]

  def index
    @movies = if params[:filter] == 'upcoming'
                Movie.where('released_on > ?', Date.today)
              elsif params[:filter] == 'popular'
                Movie.where('rating >= 3.5 AND released_on < ?', Date.today)
              else
                Movie.all
              end
  end

  def show
    @movie
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = current_user.movies.new(movie_params)
    if @movie.save
      redirect_to @movie, notice: 'Successfully created movie!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @movie
  end

  def update
    if @movie.update(movie_params)
      redirect_to @movie,
                  notice: 'Successfully Updated your Movie!'
    else
      render :edit, status: :unprocessable_entity,
                    alert: 'Error'
    end
  end

  def destroy
    @movie.destroy
    redirect_to @movie, status: :see_other,
<<<<<<< HEAD
                        notice: 'Successfully Deleted Movie!'
=======
    notice: "Successfully deleted movie!"
>>>>>>> 55a66941968580ad870a4a7a556fdc3fd063f09e
  end

  def about
  end

  def search
    @keyword = params[:search].downcase.strip
    @search = Movie.where('lower(name) LIKE :keyword OR lower(description) LIKE :keyword OR released_on LIKE :keyword',
                          keyword: "%#{@keyword}%")
    category = Category.find_by('name LIKE :keyword', keyword: "%#{@keyword}%") if Category.name.present?
    @search = category.movies if category.present?
    render 'search'
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :rating, :description, :director, :released_on, :category_id, :image)
  end

  def movie_object
    @movie = Movie.find(params[:id])
  rescue ActiveRecord::RecordNotFound
<<<<<<< HEAD
    redirect_to movies_path, alert: 'Movie not found'
=======
    redirect_to movies_path, alert: "Movie not found"
>>>>>>> 55a66941968580ad870a4a7a556fdc3fd063f09e
  end
end

