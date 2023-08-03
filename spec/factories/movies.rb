FactoryBot.define do

  factory :movie do
  	name { "SampleMovie" }
    rating { 5 }
    description { "This is a sample movie description." }
    released_on { Date.today }
    director { "Sample Director" }
  	association :user
    association :category
  end
 
end
