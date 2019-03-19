FactoryBot.define do
  factory :contact do
    application { FactoryBot.create(:application) }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    position { Faker::Job.title }
    phone { Faker::PhoneNumber.phone_number }
    email { Faker::Internet.email }
  end
end