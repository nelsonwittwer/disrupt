require 'spec_helper'

describe "DeviseUsers" do
	describe "Factory should be valid" do
		@user=FactoryGirl.create(:user)
		binding.pry
	  	@user.should be_valid
	end
end
