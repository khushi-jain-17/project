class CategoriesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    if params[:category].present?
      @category = Category.where(name: params[:category])
    else
      @category = Category.all
    end
  end
end
