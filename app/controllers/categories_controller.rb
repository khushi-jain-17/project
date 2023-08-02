# frozen_string_literal: true

class CategoriesController < ApplicationController
<<<<<<< HEAD
  def index
    @category = Category.where(name: params[:category])
  end
=======
  
   def index
     if params[:category].present?
       @category = Category.where(name: params[:category])
     else
       @category = Category.all
     end
   end

>>>>>>> 55a66941968580ad870a4a7a556fdc3fd063f09e
end



