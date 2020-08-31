
FactoryBot.define do
  factory :user do
    name { "testuser1" }
    email { "test@mail.com" }
    password { "testpass1" }
  end
end