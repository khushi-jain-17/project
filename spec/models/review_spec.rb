require 'rails_helper'

RSpec.describe Review, type: :model do
  describe "review model testing" do
  	it "validates review instance" do
  		user=User.create(name:'jay',email:'jay@gmail.com')
  		movie=Movie.create(name:'inception',rating: 3,released_on:'17 Jul 2024')

  		review=Review.new(body:"",star: 4,user:user,movie: movie)
  		expect(review).to be_valid
  	end
  end
    
  describe "associations" do    
  	it "expect be associated with a user" do
       no_user_review = Review.new(:user => nil)
       expect(no_user_review).to be_invalid
    end

    it "expect be associated with a movie" do
    	no_movie_review = Review.new(:movie => nil)
    	expect(no_movie_review).to be_invalid
    end
  end
end
