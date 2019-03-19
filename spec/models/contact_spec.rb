require 'rails_helper'

RSpec.describe Contact, type: :model do

  before(:each) do 
    @contact = FactoryBot.create(:contact)    
  end

  it "has a valid factory" do
    expect(build(:contact)).to be_valid
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@contact).to be_a(Contact)
    end

  end

  context "associations" do

    describe "contact" do 
      it { expect(@contact).to belong_to(:application) }
    end

  end

end