FactoryBot.define do

  factory :user do

    name { "samplename" }
    sequence(:email) { |n| "user#{n}@example.com" }	
  	password { "password" }
  	role { nil }
  	admin {nil}

  end
 
end
