# frozen_string_literal: true

class CategoriesController < ApplicationController
  def index
    @category = Category.where(name: params[:category])
  end
end
