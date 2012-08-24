require 'spec_helper'

describe Comment do
	
	before do
		User.delete_all
		@startup=FactoryGirl.create(:startup)
		@user=FactoryGirl.create(:user)
		@topic = Topic.new(name: "Topic")
		@discussion = @startup.discussions.new(user_id: @user.id, topic_id: @topic.id)
		@comment=@discussion.comments.new(text: "this is a comment", user_id: @user.id)
	end
    
    context "it should respond to attributes" do
        it "should have a title" do
        	@comment.should respond_to(:text)
        end
        it "should have a user_id" do
        	@comment.should respond_to(:user_id)
        end
        it "should have a topic_id" do
        	@comment.should respond_to(:imageable_id)
        end
    end

    context "should pass validators" do
    	it "for title" do
	        @comment.text = nil
	        @comment.should_not be_valid
	    end
	    it "for user_id" do
	        @comment.user_id = nil
	        @comment.should_not be_valid
	    end
	    it "for imageable_id" do
	        @comment.imageable_id = nil
	        @comment.should_not be_valid
	    end
    end
    
   

    context "CanCan authorization" do

        context "for usuers" do
            it "should allow regular users to create a comment" do
                user=FactoryGirl.create(:user)
                ability=Ability.new(user)
                authorize = ability.can? :create, @comment
                authorize.should be_true
            end

            it "should allow regular users to edit a comment if they own it" do
                user=FactoryGirl.create(:user)
                @comment.user_id=user.id
                ability=Ability.new(user)
                authorize = ability.can? :update, @comment
                authorize.should be_true
            end

            it "shouldn't allow regular users to edit a comment if they don't own it" do
                user=FactoryGirl.create(:user)
                ability=Ability.new(user)
                authorize = ability.can? :update, @comment
                authorize.should be_false
            end

            it "should allow regular users to destroy a comment if they own it" do
                user=FactoryGirl.create(:user)
                @comment.user_id=user.id
                ability=Ability.new(user)
                authorize = ability.can? :delete, @comment
                authorize.should be_true
            end

            it "shouldn't allow regular users to destroy a comment if they don't own it" do
                user=FactoryGirl.create(:user)
                ability=Ability.new(user)
                authorize = ability.can? :delete, @comment
                authorize.should be_false
            end
        end

        context "for admins" do
            it "should allow admins to create any comment" do
            user=FactoryGirl.create(:admin)
            ability=Ability.new(user)
            authorize = ability.can? :create, @comment
            authorize.should be_true
            end 

            it "should allow admins to edit any comment" do
                user=FactoryGirl.create(:admin)
                ability=Ability.new(user)
                authorize = ability.can? :update, @comment
                authorize.should be_true
            end

            it "should allow admins to delete any comment" do
                user=FactoryGirl.create(:admin)
                ability=Ability.new(user)
                authorize = ability.can? :delete, @comment
                authorize.should be_true
            end
        end

        context "for moderators" do
            it "should allow moderators to create any comment" do
            user=FactoryGirl.create(:mod)
            ability=Ability.new(user)
            authorize = ability.can? :create, @comment
            authorize.should be_true
            end 

            it "should allow moderators to edit any comment" do
                user=FactoryGirl.create(:mod)
                ability=Ability.new(user)
                authorize = ability.can? :update, @comment
                authorize.should be_true
            end

            it "should allow moderators to delete any comment" do
                user=FactoryGirl.create(:mod)
                ability=Ability.new(user)
                authorize = ability.can? :delete, @comment
                authorize.should be_true
            end
        end  
    end
end
