require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe "movie model testing" do
    let(:user) {create :user}
    let(:category) {create :category}
    let(:movie) {create :movie}
  	it "validates movie instance" do
      expect(movie).to be_valid
  	end
  end

  describe "associations" do
  	it "expect be associated with a user" do
       no_user_movie = Movie.new(:user => nil)
       expect(no_user_movie).to be_invalid
    end

    it "expect be associated with a category" do
    	no_category_movie=Movie.new(category:nil)
    	expect(no_category_movie).to_not be_valid
    end
  end
end
