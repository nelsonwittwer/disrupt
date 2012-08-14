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
        subject {startup}

    it { should respond_to(:crunchbase) }
    it { should respond_to(:description) }
    it { should respond_to(:name) }
    it { should respond_to(:twitter) }
    it { should respond_to(:url) }
    it {should be_valid}
    
    describe "discussions" do
        let(:startup){FactoryGirl.create(:startup)}

        d = startup.discussions.new
        d.title="The world is a vampire"
        d.save
        d.startup should eq(startup)
        startup.discussions.first should eq(discussions)
    end

end

