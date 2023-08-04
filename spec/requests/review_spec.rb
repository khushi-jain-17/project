require 'rails_helper'

RSpec.describe "Reviews", type: :request do

	describe "POST /movies/:movie_id/reviews" do
		let(:user) { create(:user) }
    let(:movie) { create(:movie) }
		let(:review) {create(:review,user: user,movie: movie)}
      it "works!" do
        post "/movies/#{movie.id}/reviews"
        expect(response).to have_http_status(302)
      end
    end

    describe "GET /movies/:id/edit" do
    	let(:user) { create(:user) }
     	let(:movie) { create(:movie) }
     	let(:review) { create(:review,user: user,movie: movie)}
     it "edit a specific review" do
      get "/movies/:movie_id/reviews/:id/edit"
      expect(response).to have_http_status(302)
     end
    end

    describe "PUT /movies/:id/reviews/:id" do
    	let(:user) { create(:user )} 
    	let(:movie) { create(:movie) }
     	let(:review) { create(:review,user: user,movie: movie)}
     it "updates a specific movie" do
      put "/movies/:movie_id/reviews/:id"
      expect(response).to have_http_status(302)
     end
    end

   describe "DELETE /movies/:movie_id/reviews/:id" do
     	let(:user) { create(:user) }
     	let(:movie) { create(:movie) }
     	let(:review) { create(:review,user: user,movie: movie)}
      it "delete movie response" do	
       delete "/movies/:movie_id/reviews/:id"	  
       expect(response).to have_http_status(302)
      end
    end
end
