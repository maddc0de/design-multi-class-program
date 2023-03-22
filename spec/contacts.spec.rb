require 'contacts'

RSpec.describe Contacts do
  it "constructs" do
    contacts = Contacts.new
  end

  it "returns an empty list of phone numbers initially" do
    contacts = Contacts.new
    expect(contacts.view_phone_numbers).to eq []
  end
end