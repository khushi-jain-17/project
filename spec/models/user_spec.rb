require 'rails_helper'

RSpec.describe User, type: :model do
  describe "user model testing" do
  	let(:user) {create(:user)}
    it "validates user instance" do
   	  expect(user).to be_valid
   	end
   end

   describe "has many association" do
   	it "has many reviews" do
      should respond_to(:reviews)
    end

    it "has many movies" do
      should respond_to(:movies)
    end
    
    # describe User do
    #   it { should have_many(:movies).through(:reviews) }
    # end


   end
end
