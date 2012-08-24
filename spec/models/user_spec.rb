require 'spec_helper'

describe User do

	before :all do
		User.delete_all
		@user=FactoryGirl.create(:user)
	end

	context "registration proces" do
		it "should be valid" do
		  	@user.should be_valid
		end

		it "should not be valid without a name " do
			@user.name = nil
			@user.should_not be_valid
		end

		it "should require an email address" do
			@user.email = nil
			@user.should_not be_valid
		end

		it "should require an encrypted password" do
			@user.password = nil
			@user.should_not be_valid
		end
	end
end
