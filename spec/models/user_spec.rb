require 'rails_helper'

RSpec.describe User, type: :model do
  describe "user model testing" do
    it "validates user instance" do
   	  user=User.new(name: "khushi",email: "khushi@gmail.com",password: "password",role: "admin",admin: nil)
   	  expect(user).to be_valid
   	end
   end
end
