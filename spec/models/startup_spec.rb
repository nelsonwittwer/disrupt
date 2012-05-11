require 'spec_helper'

describe Startup do
	before{ @startup = Startup.new(name:"FooBar.com", description: "asdf")}

	subject {@startup}

	it { should respond_to(:crunchbase) }
    it { should respond_to(:description) }
    it { should respond_to(:name) }
    it { should respond_to(:screenshot) }
    it { should respond_to(:twitter) }
    it { should respond_to(:url) }
    it { should respond_to(:logo) }

    it {should be_valid}

end

