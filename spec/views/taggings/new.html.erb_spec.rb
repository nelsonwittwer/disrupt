require 'spec_helper'

describe "taggings/new" do
  before(:each) do
    assign(:tagging, stub_model(Tagging,
      :startup_id => 1,
      :tag_id => 1
    ).as_new_record)
  end

  it "renders new tagging form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => taggings_path, :method => "post" do
      assert_select "input#tagging_startup_id", :name => "tagging[startup_id]"
      assert_select "input#tagging_tag_id", :name => "tagging[tag_id]"
    end
  end
end
