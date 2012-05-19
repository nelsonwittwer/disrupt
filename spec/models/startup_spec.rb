require 'spec_helper'

describe Startup do

    subject {page}
    
    describe "profile page" do
    	let(:startup){FactoryGirl.create(:startup)}
        
        before { visit startup_path(startup) }

    	it { should respond_to(:crunchbase) }
        it { should respond_to(:description) }
        it { should respond_to(:name) }
        it { should respond_to(:twitter) }
        it { should respond_to(:url) }
        it { should respond_to(:logo) }

        it {should be_valid}

    end

end

