# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    name { 'Category 1' }
    description { 'Category 1 description' }
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
