require 'spec_helper'

describe "taggings/edit" do
  before(:each) do
    @tagging = assign(:tagging, stub_model(Tagging,
      :startup_id => 1,
      :tag_id => 1
    ))
  end

  it "renders the edit tagging form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => taggings_path(@tagging), :method => "post" do
      assert_select "input#tagging_startup_id", :name => "tagging[startup_id]"
      assert_select "input#tagging_tag_id", :name => "tagging[tag_id]"
    end
  end
end
