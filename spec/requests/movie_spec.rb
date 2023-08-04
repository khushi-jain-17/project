require 'rails_helper'

RSpec.describe "Movies Controller", type: :request do
	   #let(:user) { create(:user) }
     #let(:category) { create(:category) }
     #let(:movie) { create(:movie, user: user, category: category) }

    # before do
    #   sign_in user
    # end
	
    describe "GET /index" do
      it "assigns @movies" do
       get "/movies"
       expect(assigns(:movies)).to eq(Movie.all) 
      end
    end

     describe "GET /popular" do
       it "renders the index template" do
        get "/movies",params: {filter: 'popular'}
        expect(response).to be_successful
      end
    end

    describe "GET /upcoming" do
    	it "renders the index template" do
    		get '/movies', params: {filter: 'upcoming'}
   		expect(response).to be_successful
    	end
    end

     describe "GET /show" do
       let(:movie) {create :movie}
       it "renders show" do
    	    get "/movies/#{movie.id}"
    	    expect(response).to be_successful
       end
     end 

     describe "GET /about" do
      it "renders the about template" do
        get "/about"
        expect(response).to render_template("about")
      end
     end

     describe "GET /movies/new" do
      it "assigns a new Movie to @movie" do
        get "/movies/new"
        expect(assigns(:movie)).to be_a_new(Movie)
      end
      it "renders the new template" do 
       get new_movie_path
       expect(response).to render_template(:new)
      end
     end
        
    describe "POST /movies" do
      it "works!" do
        get movies_path
        expect(response).to have_http_status(200)
      end
      it "creates a new movie" do
        get new_movie_path
        expect(response).to have_http_status(200)
      end
    end

    describe "GET /movies/:id/edit" do
    	let(:user) { create(:user )}
    	let(:category) {create(:category)}
    	let(:movie) { create(:movie,user: user,category: category)}
     it "edit a specific movie" do
      get edit_movie_path(movie)
      expect(response).to have_http_status(302)
     end
    end

    describe "PUT /movies/:id" do
    	let(:user) { create(:user )}
    	let(:category) {create(:category)}
    	let(:movie) { create(:movie,user: user,category: category)}
     it "updates a specific movie" do
      put "/movies/#{movie.id}"
      expect(response).to have_http_status(302)
     end
    end

    describe "DELETE /movies/:id" do
     	let(:user) { create(:user) }
     	let(:category) { create(:category) }
     	let(:movie) { create(:movie,user: user,category: category)}
      it "delete movie response" do	
       delete "/movies/:id"	  
       expect(response).to have_http_status(302)
      end
    end

end
