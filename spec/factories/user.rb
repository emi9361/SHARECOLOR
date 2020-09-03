
FactoryBot.define do
  factory :user do
    name { "testuser1" }
    sequence(:email) { |n| "test#{n}@example.com"}
    password { "testpass1" }
  end
end