FactoryBot.define do
  factory :category do
    name { "MyString" }
    description { "MyText" }
    category { nil }
    user { nil }
  end

  factory(:user) do
    name { 'Sample User' }
    email { 'user@email.com' }
    password { 'password' }
  end

  factory(:account) do
    name { 'Account 1' }
    description { 'Account 1 description' }
  end
end