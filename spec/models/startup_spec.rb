# == Schema Information
#
# Table name: startups
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  url         :string(255)
#  twitter     :string(255)
#  crunchbase  :string(255)
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'spec_helper'

describe Startup do
    let(:startup){FactoryGirl.create(:startup)}
    
    describe "it should respond to attributes" do

        subject {startup}

        it { should respond_to(:crunchbase) }
        it { should respond_to(:description) }
        it { should respond_to(:name) }
        it { should respond_to(:twitter) }
        it { should respond_to(:url) }
        it { should respond_to(:discussions) }
        it { should respond_to(:screenshot) }
        it { should respond_to(:startup_logo) }
        it {should be_valid}

    end

    it "has a valid factory" do
        Factory.create(:startup).should be_valid
    end
    
    it "should pass validators" do
        @s = Factory.build(:startup, url:nil)
        @s.should_not be_valid
    end

    context "CanCan authorization" do

        context "for usuers" do
            it "shouldn't allow regular users to create a startup" do
                user=FactoryGirl.create(:user)
                ability=Ability.new(user)
                authorize = ability.can? :create, Startup
                authorize.should be_false
            end

            it "shouldn't allow regular users to edit a startup" do
                user=FactoryGirl.create(:user)
                ability=Ability.new(user)
                authorize = ability.can? :update, Startup
                authorize.should be_false
            end

            it "shouldn't allow regular users to delete a startup" do
                user=FactoryGirl.create(:user)
                ability=Ability.new(user)
                authorize = ability.can? :delete, Startup
                authorize.should be_false
            end
        end

        context "for admins" do
            it "should allow admins to create a startup" do
            user=FactoryGirl.create(:admin)
            ability=Ability.new(user)
            authorize = ability.can? :create, Startup
            authorize.should be_true
            end 

            it "should allow admins to edit a startup" do
                user=FactoryGirl.create(:admin)
                ability=Ability.new(user)
                authorize = ability.can? :update, Startup
                authorize.should be_true
            end

            it "should allow admins to delete a startup" do
                user=FactoryGirl.create(:admin)
                ability=Ability.new(user)
                authorize = ability.can? :delete, Startup
                authorize.should be_true
            end
        end

        context "for moderators" do
            it "should allow moderators to create a startup" do
            user=FactoryGirl.create(:mod)
            ability=Ability.new(user)
            authorize = ability.can? :create, Startup
            authorize.should be_true
            end 

            it "should allow moderators to edit a startup" do
                user=FactoryGirl.create(:mod)
                ability=Ability.new(user)
                authorize = ability.can? :update, Startup
                authorize.should be_true
            end

            it "should allow moderators to delete a startup" do
                user=FactoryGirl.create(:mod)
                ability=Ability.new(user)
                authorize = ability.can? :delete, Startup
                authorize.should be_true
            end
        end  

    end

   

end

