require 'rails_helper'

RSpec.describe "books/new", type: :view do
  before(:each) do
    assign(:book, Book.new(
      :isbn => "MyString",
      :pages => 1,
      :title => "MyString",
      :description => "MyText"
    ))
  end

  it "renders new book form" do
    render

    assert_select "form[action=?][method=?]", books_path, "post" do

      assert_select "input[name=?]", "book[isbn]"

      assert_select "input[name=?]", "book[pages]"

      assert_select "input[name=?]", "book[title]"

      assert_select "textarea[name=?]", "book[description]"
    end
  end
end
