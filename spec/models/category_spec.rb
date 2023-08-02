require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "category model testing" do
  	it "validates category instance" do
  		category=Category.new(name: "Hollywood")
  		expect(category).to be_valid
  	end
  end

  describe "associations" do
  	it { should have_many(:movies) }
    context "when a category is deleted" do
      let(:category) { create(:category) }
      let(:movie1) { create(:movie, category: category) }
      let(:movie2) { create(:movie, category: category) }

      it "should also delete associated movies" do
        expect { category.destroy }.to change { Movie.count }.by(-2)
      end
    end
  end
end
