require 'rails_helper'
RSpec.describe "Categories", type: :request do
  describe "GET /index" do
  	let (:category) { create(:category) }
    it "assigns @categories" do
      get '/category'
      expect(response).to have_http_status(302)     
    end
  end
end
