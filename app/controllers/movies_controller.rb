class MoviesController < ApplicationController
  def index
    if params[:filter] == "upcomming"
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
  	@movie= Movie.new
  end
  def create
  	@movie=current.user.movies.new(movie_params)
  	if @movie.save
  		redirect_to @movie, notice: "successfully created movie"
  	else
  		render :new, status: :unprocessable_entity
  	end
  end	
  def edit
  	@movie
  end
  def update
  	if @movie.update(movie_params)
  		redirect_to @movie, notice: "successfully updated"
  	else
  		render :edit, status: :unprocessable_entity, alert: "error updating the movie"
  	end
  end

  def destroy
    @movie.destroy
    redirect_to root_path, status: :see_other,
    notice: "Successfully Deleted Movie!"
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
  	@movie=Movie.find(params[:id])
  end
  
end


