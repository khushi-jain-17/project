FactoryBot.define do

  factory :user do

    sequence(:email) { |n| "user#{n}@example.com" }
  	name { "somyaa" }
  	
  	password { "password" }
  	role { "user"}
  	admin {nil}

  end
 
end
