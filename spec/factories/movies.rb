FactoryBot.define do

  factory :movie do
  	name { "Sample Movie" }
    rating { '5'}
    description { "This is a sample movie description." }
    released_on { "2024-7-17" }
    director { "Sample Director" }
  	association :user
    association :category
  end
 
end
