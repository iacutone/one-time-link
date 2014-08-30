require 'rails_helper'

RSpec.describe "links/new", :type => :view do
  before(:each) do
    assign(:link, Link.new(
      :s3_url => "MyString",
      :user_id => "MyString"
    ))
  end

  it "renders new link form" do
    render

    assert_select "form[action=?][method=?]", links_path, "post" do

      assert_select "input#link_s3_url[name=?]", "link[s3_url]"

      assert_select "input#link_user_id[name=?]", "link[user_id]"
    end
  end
end
