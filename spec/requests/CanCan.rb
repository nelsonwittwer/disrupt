require 'spec_helper'

describe "CanCan" do
    include Rails.application.routes.url_helpers

    @startup=FactoryGirl.create(:startup)

	def login_a_sample_user
		visit root_path
		@user=FactoryGirl.create(:user)
		click_link "Sign in"
		fill_in 'Email', :with => "#{@user.email}"
		fill_in 'Password', :with => 'foobar'
		click_button "signin_btn"
	end

	def login_a_sample_user2
		visit root_path
		@user2=FactoryGirl.create(:user)
		click_link "Sign in"
		fill_in 'Email', :with => "#{@user.email}"
		fill_in 'Password', :with => 'foobar'
		click_button "signin_btn"
	end

	context "for Startups" do
	 	it "shouldn't allow regular users to create a startup" do
	        login_a_sample_user
	        visit "/startups/new"
	        page.should have_content("You are not authorized")
	    end
	end

	context "for discussions" do
		it "should allow the creators to edit their discussion" do
			login_a_sample_user
			visit new_startup_discussion_path(@startup)

		end
	end
end