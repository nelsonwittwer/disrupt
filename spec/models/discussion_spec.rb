require 'spec_helper'

describe Discussion do

	before do
		@startup=FactoryGirl.create(:startup)
		@user=FactoryGirl.create(:user)
		@topic = Topic.new(name: "Topic")
		@discussion = @startup.discussions.new(user_id: @user.id, topic_id: @topic.id)
	end
    
    context "it should respond to attributes" do
        it "should have a title" do
        	@discussion.should respond_to(:title)
        end
        it "should have a user_id" do
        	@discussion.should respond_to(:user_id)
        end
        it "should have a topic_id" do
        	@discussion.should respond_to(:topic_id)
        end
        it "should have comments" do
        	@discussion.should respond_to(:comments)
        end
        it "should have a body" do
            @discussion.should respond_to(:discussion_body)
        end
    end

    context "should pass validators" do
    	it "for title" do
	        @discussion.title = nil
	        @discussion.should_not be_valid
	    end
	    it "for user_id" do
	        @discussion.user_id = nil
	        @discussion.should_not be_valid
	    end
	    it "for topic_id" do
	        @discussion.topic_id = nil
	        @discussion.should_not be_valid
	    end
    end
    
   

    context "CanCan authorization" do

        context "for usuers" do
            it "should allow regular users to create a discussion" do
                user=FactoryGirl.create(:user)
                ability=Ability.new(user)
                authorize = ability.can? :create, @discussion
                authorize.should be_true
            end

            it "should allow regular users to edit a discussion if they own it" do
                user=FactoryGirl.create(:user)
                @discussion.user_id=user.id
                ability=Ability.new(user)
                authorize = ability.can? :update, @discussion
                authorize.should be_true
            end

            it "shouldn't allow regular users to edit a discussion if they don't own it" do
                user=FactoryGirl.create(:user)
                ability=Ability.new(user)
                authorize = ability.can? :update, @discussion
                authorize.should be_false
            end

            it "should allow regular users to destroy a discussion if they own it" do
                user=FactoryGirl.create(:user)
                @discussion.user_id=user.id
                ability=Ability.new(user)
                authorize = ability.can? :delete, @discussion
                authorize.should be_true
            end

            it "shouldn't allow regular users to destroy a discussion if they don't own it" do
                user=FactoryGirl.create(:user)
                ability=Ability.new(user)
                authorize = ability.can? :delete, @discussion
                authorize.should be_false
            end
        end

        context "for admins" do
            it "should allow admins to create any discussion" do
            user=FactoryGirl.create(:admin)
            ability=Ability.new(user)
            authorize = ability.can? :create, @discussion
            authorize.should be_true
            end 

            it "should allow admins to edit any discussion" do
                user=FactoryGirl.create(:admin)
                ability=Ability.new(user)
                authorize = ability.can? :update, @discussion
                authorize.should be_true
            end

            it "should allow admins to delete any discussion" do
                user=FactoryGirl.create(:admin)
                ability=Ability.new(user)
                authorize = ability.can? :delete, @discussion
                authorize.should be_true
            end
        end

        context "for moderators" do
            it "should allow moderators to create any discussion" do
            user=FactoryGirl.create(:mod)
            ability=Ability.new(user)
            authorize = ability.can? :create, @discussion
            authorize.should be_true
            end 

            it "should allow moderators to edit any discussion" do
                user=FactoryGirl.create(:mod)
                ability=Ability.new(user)
                authorize = ability.can? :update, @discussion
                authorize.should be_true
            end

            it "should allow moderators to delete any discussion" do
                user=FactoryGirl.create(:mod)
                ability=Ability.new(user)
                authorize = ability.can? :delete, @discussion
                authorize.should be_true
            end
        end  

    end
end
