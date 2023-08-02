FactoryBot.define do
  factory :review do
  	star { 4 }
  	body { "sample" }
    association  :user
  	association  :movie
  end
end
