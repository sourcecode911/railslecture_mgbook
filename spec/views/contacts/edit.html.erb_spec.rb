require 'rails_helper'

RSpec.describe "contacts/edit", type: :view do
  before(:each) do
    @contact = assign(:contact, Contact.create!(
      :vorname => "MyString",
      :nachname => "MyString",
      :email => "MyString",
      :user_id => 1
    ))
  end

  it "renders the edit contact form" do
    render

    assert_select "form[action=?][method=?]", contact_path(@contact), "post" do

      assert_select "input[name=?]", "contact[vorname]"

      assert_select "input[name=?]", "contact[nachname]"

      assert_select "input[name=?]", "contact[email]"

      assert_select "input[name=?]", "contact[user_id]"
    end
  end
end
