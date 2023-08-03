# frozen_string_literal: true

class CategoriesController < ApplicationController
<<<<<<< HEAD
  def index
    @category = Category.where(name: params[:category])
  end
  
   def index
     if params[:category].present?
       @category = Category.where(name: params[:category])
     else
       @category = Category.all
     end
   end


end



