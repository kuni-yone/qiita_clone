FactoryBot.define do
  factory :user do
    provider { "email" }
    name { Faker::Name.name }
    sequence(:email) {|n| "#{n}_#{Faker::Internet.email}" }
    password { Faker::Internet.password }
  end
end
