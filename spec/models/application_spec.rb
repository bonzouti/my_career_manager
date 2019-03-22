require 'rails_helper'

RSpec.describe Application, type: :model do

  before(:each) do 
    @application = FactoryBot.create(:application)    
  end

  it "has a valid factory" do
    expect(build(:application)).to be_valid
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@application).to be_a(Application)
    end

    describe "#company_name" do
      it { expect(@application).to validate_presence_of(:company_name) }
    end

    describe "#position" do
      it { expect(@application).to validate_presence_of(:jobtitle) }
    end

  end

  context "associations" do

    describe "applications" do
      it { expect(@application).to have_many(:steps) }
      it { expect(@application).to have_many(:contacts) }  
      it { expect(@application).to belong_to(:user) }
    end

  end

end