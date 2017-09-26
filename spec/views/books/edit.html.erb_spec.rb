require 'rails_helper'

RSpec.describe "books/edit", type: :view do
  before(:each) do
    @book = assign(:book, Book.create!(
      :isbn => "MyString",
      :pages => 1,
      :title => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit book form" do
    render

    assert_select "form[action=?][method=?]", book_path(@book), "post" do

      assert_select "input[name=?]", "book[isbn]"

      assert_select "input[name=?]", "book[pages]"

      assert_select "input[name=?]", "book[title]"

      assert_select "textarea[name=?]", "book[description]"
    end
  end
end
