require 'spec_helper'

describe "DeviseUsers" do


	context "authentication for a user" do

		def login_a_sample_user
			visit root_path
			@user=FactoryGirl.create(:user)
			click_link "Sign in"
			fill_in 'Email', :with => "#{@user.email}"
			fill_in 'Password', :with => 'foobar'
			click_button "signin_btn"
		end

		it "should allow you to login" do
			login_a_sample_user
			page.should have_content("Welcome back!")
		end

		it "should allow you to log out" do
			login_a_sample_user
			click_link 'Sign out'
			page.should have_content ("Thanks for stopping by!")
		end

		it "should keep you signed in even after you leave" do
			login_a_sample_user
			visit "http://google.com"
			visit root_path
			page.should_not have_link ("Sign in")
		end

		context "editing profiles" do

			it "should be able to edit their profile" do
				login_a_sample_user
				visit user_path(@user)
				click_link 'Edit Profile'
				page.should have_content("Edit")
			end

			it "should only allow you to edit your account" do
				@user2=FactoryGirl.create(:user)
				login_a_sample_user
				visit edit_user_path(@user2)
				page.should have_content("You are not authorized to access this page")
			end
		end
	end
end
