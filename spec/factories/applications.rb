FactoryBot.define do
  factory :application do
    user { FactoryBot.create(:user) }
    company_name { Faker::Company.name }
    position { Faker::Company.profession }
    status { ["identified", "applied", "in_progress", "archived"].sample }
    joboffer_link { Faker::Internet.url }
    joboffer_description { Faker::Company.bs }
    notes { Faker::Hacker.say_something_smart }
  end
end