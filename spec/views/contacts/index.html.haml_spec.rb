require 'rails_helper'

RSpec.describe "contacts/index", type: :view do
  before(:each) do
    assign(:contacts, [
      Contact.create!(
        :vorname => "Vorname",
        :nachname => "Nachname",
        :email => "Email",
        :user_id => 2
      ),
      Contact.create!(
        :vorname => "Vorname",
        :nachname => "Nachname",
        :email => "Email",
        :user_id => 2
      )
    ])
  end

  it "renders a list of contacts" do
    render
    assert_select "tr>td", :text => "Vorname".to_s, :count => 2
    assert_select "tr>td", :text => "Nachname".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
