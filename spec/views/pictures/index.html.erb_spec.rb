require 'spec_helper'

describe "pictures/index" do
  before(:each) do
    assign(:pictures, [
      stub_model(Picture,
        :url => "Url"
      ),
      stub_model(Picture,
        :url => "Url"
      )
    ])
  end

  it "renders a list of pictures" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Url".to_s, :count => 2
  end
end
