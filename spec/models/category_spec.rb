require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "category model testing" do
    let(:category) { create(:category)}
  	it "validates category instance" do
  		expect(category).to be_valid
  	end
  end

  describe "has many association" do
    it "has many movies" do
      should respond_to(:movies)
    end
  end  

end
