require 'spec_helper'

describe "taggings/show" do
  before(:each) do
    @tagging = assign(:tagging, stub_model(Tagging,
      :startup_id => 1,
      :tag_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
