class CategoriesController < ApplicationController
  
  def index
  	byebug
    if params[:category].present?
      @category = Category.where(name: params[:category])
    else
      @category = Category.all
    end
  end
end
