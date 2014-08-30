require 'rails_helper'

RSpec.describe "links/index", :type => :view do
  before(:each) do
    assign(:links, [
      Link.create!(
        :s3_url => "S3 Url",
        :user_id => "User"
      ),
      Link.create!(
        :s3_url => "S3 Url",
        :user_id => "User"
      )
    ])
  end

  it "renders a list of links" do
    render
    assert_select "tr>td", :text => "S3 Url".to_s, :count => 2
    assert_select "tr>td", :text => "User".to_s, :count => 2
  end
end
