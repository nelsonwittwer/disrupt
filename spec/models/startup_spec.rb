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
        it {should be_valid}

    end

    it "has a valid factory" do
        Factory.create(:startup).should be_valid
    end
    
    # describe "it should pass validators" do
    #     @s = Factory.build(:startup, url:nil)
    #     @s.should_not be_valid
    # end

end

