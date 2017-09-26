require 'rails_helper'

RSpec.describe "contacts/show", type: :view do
  before(:each) do
    @contact = assign(:contact, Contact.create!(
      :vorname => "Vorname",
      :nachname => "Nachname",
      :email => "Email",
      :user_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Vorname/)
    expect(rendered).to match(/Nachname/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/2/)
  end
end
