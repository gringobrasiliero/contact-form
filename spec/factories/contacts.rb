FactoryBot.define do
  factory :contact do
    first_name { Faker::Lorem.word }
    last_name { Faker::Lorem.word }
    phone_number { Faker::Lorem.word }
    email { Faker::Lorem.word }
    created_at { Time.now }
  end
end
