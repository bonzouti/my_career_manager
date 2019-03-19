FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { "azerty2020" }
  end
end