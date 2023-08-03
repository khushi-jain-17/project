require 'rails_helper'

RSpec.describe "Categories", type: :request do
	let(:user) {create :user}
	before do
		sign_in user
	end
    let(:category) {create(:category)}
    describe "GET /index" do
  	
  	 it "assigns @category" do
       get "/category"
       expect(response).to be_successful 
     end
    end
end
