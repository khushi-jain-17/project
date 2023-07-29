class MoviesController < ApplicationController
  before_action :authenticate_user! ,only: [:create,:edit,:destroy,:update]
  before_action :movie_object ,only: [:show,:edit,:destroy,:update]

  def index
    if params[:filter] == "upcoming"
      @movies = Movie.where("released_on > ?",Date.today)
    elsif params[:filter] == "popular"
      @movies = Movie.where("rating >= 3.5")
    else
      @movies = Movie.all
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
      redirect_to @movie, notice: "Successfully created movie!"
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
      notice: "Successfully Updated your Movie!"
    else
      render :edit, status: :unprocessable_entity ,
      alert:"Error"
    end
  end

  def destroy
    @movie.destroy
    redirect_to @movie, status: :see_other,
    notice: "Successfully deleted movie!"
  end


  def about
  end

  def search
    @keyword = params[:search].downcase.strip
    @search = Movie.where("lower(name) LIKE :keyword OR lower(description) LIKE :keyword OR released_on LIKE :keyword", keyword: "%#{@keyword}%")                   
    category= Category. find_by("name LIKE :keyword", keyword: "%#{@keyword}%")if Category.name.present?
    @search = category.movies  if category.present?   
    if @search.present?
      render 'search'
    else
      render 'search'
    end 
  end

  private
  
  def movie_params
    params.require(:movie).permit(:name,:rating,:description,:director,:released_on,:category_id,:image)
  end

  def movie_object
    @movie = Movie.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to movies_path, alert: "Movie not found"
  end
end

