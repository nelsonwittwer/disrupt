require 'spec_helper'

describe "images/index" do
  before(:each) do
    assign(:images, [
      stub_model(Image,
        :image_name => "Image Name"
      ),
      stub_model(Image,
        :image_name => "Image Name"
      )
    ])
  end

  it "renders a list of images" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Image Name".to_s, :count => 2
  end
end
