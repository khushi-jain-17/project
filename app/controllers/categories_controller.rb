class CategoriesController < ApplicationController
  
   def index
     if params[:category].present?
       @category = Category.where(name: params[:category])
     else
       @category = Category.all
     end
   end

end



