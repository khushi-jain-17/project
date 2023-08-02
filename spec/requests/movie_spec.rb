require 'rails_helper'

RSpec.describe "List of all Movies", type: :request do
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

    describe "GET /movies/new" do
     it "assigns a new Movie to @movie" do
       get "/movies/new"
       expect(assigns(:movie)).to be_a_new(Movie)
     end
    end
    
    describe "GET /about" do
     it "renders the about template" do
       get "/about"
       expect(response).to render_template("about")
     end
    end

    describe "POST /movies" do
      it "renders the create template" do
    	get "/movies"
    	expect(response).to be_successful
      end	
    end

     describe "GET /edit" do	
      let(:user) {create (:user) }
      let(:category) {create (:category) }	
      let(:movie) {create (:movie)}
      it "renders edit" do
      	get "/movies/#{movie.id}/edit"
      	
   	    expect(response).to be_successful
      end
    end

     describe "PUT /update" do	
      let(:user) {create (:user) }
      let(:category) {create (:category) }	
      let(:movie) {create (:movie)}
      it "renders update" do
      	put "/movies/#{movie.id}"
      	
   	    expect(response).to be_successful
      end
    end




end
