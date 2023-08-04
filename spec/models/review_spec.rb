require 'rails_helper'

RSpec.describe Review, type: :model do
  describe "review model testing" do
    let(:user) {create(:user)}
    let(:movie) {create(:movie)}
    let(:review) {create(:review)}
  	it "validates review instance" do
  		expect(review).to be_valid
  	end
  end
    
  describe "belongs to user" do
    let(:user) {create(:user)}
    let(:review) {create(:review, user: user)}    
  	it "expect be associated with a user" do
      expect(review).to be_valid
    end
  end  

    describe "belongs to movie" do
      let(:movie) {create(:movie)}
      let(:review) {create(:review, movie: movie)}
     it "expect be associated with a movie" do
    	expect(review).to be_valid
     end
    end
end
