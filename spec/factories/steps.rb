FactoryBot.define do
  factory :step do
    application { FactoryBot.create(:application) }
    title { Faker::Company.buzzword }
    category { ["interview", "phone interview", "application sent", "follow-up"].sample }
    description { Faker::Company.catch_phrase }
    date { "2019-03-09" }
    status { Faker::Boolean.boolean }
  end
end