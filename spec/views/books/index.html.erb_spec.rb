require 'rails_helper'

RSpec.describe "books/index", type: :view do
  before(:each) do
    assign(:books, [
      Book.create!(
        :isbn => "Isbn",
        :pages => 2,
        :title => "Title",
        :description => "MyText"
      ),
      Book.create!(
        :isbn => "Isbn",
        :pages => 2,
        :title => "Title",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of books" do
    render
    assert_select "tr>td", :text => "Isbn".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
