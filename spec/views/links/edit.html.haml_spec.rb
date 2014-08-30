require 'rails_helper'

RSpec.describe "links/edit", :type => :view do
  before(:each) do
    @link = assign(:link, Link.create!(
      :s3_url => "MyString",
      :user_id => "MyString"
    ))
  end

  it "renders the edit link form" do
    render

    assert_select "form[action=?][method=?]", link_path(@link), "post" do

      assert_select "input#link_s3_url[name=?]", "link[s3_url]"

      assert_select "input#link_user_id[name=?]", "link[user_id]"
    end
  end
end
