require 'rails_helper'

RSpec.describe Step, type: :model do

  before(:each) do 
    @step = FactoryBot.create(:step)    
  end

  it "has a valid factory" do
    expect(build(:step)).to be_valid
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@step).to be_a(Step)
    end

    describe "#date" do
      it { expect(@step).to validate_presence_of(:date) }
    end

  end

  context "associations" do

    describe "applications" do
      it { expect(@step).to belong_to(:application) }
    end

  end

end