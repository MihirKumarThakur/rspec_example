require 'rails_helper'
require "spec_helper"

describe Contact do
  it "is valid with a firstname, lastname and email" do
    contact = Contact.new(
      first_name: 'Mihir',
      last_name: 'Kumar',
      email: 'mihir@geobeats.com')
    expect(contact).to be_valid
  end

  it "fails validation with no first_name" do
    expect(Contact.new(first_name: nil)).to have(1).error_on(:first_name)
  end
  
  it "is invalid without a last_name" do
    expect(Contact.new(last_name: nil)).to have(1).error_on(:last_name)
  end
  
  it "is invalid without an email address" do
    expect(Contact.new(email: nil)).to have(1).error_on(:email)
  end

  it "is invalid with duplicate email address" do
    Contact.create(
      first_name: 'mihir', last_name: 'Kumar',
        email: 'mihir@geobeats.com')
    contact = Contact.new(
      first_name: 'mihir', last_name: 'Kumar',
        email: 'mihir@geobeats.com')
    expect(contact).to have(1).error_on(:email)
  end
  
  it "returns a contact's full name as string" do
    contact = Contact.new(first_name: "Mihir", last_name: "Kumar",
      email: "mihir@geobeats.com")
    expect(contact.name).to eq "Mihir Kumar"
  end
end
