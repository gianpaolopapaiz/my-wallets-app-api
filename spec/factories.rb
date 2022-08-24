FactoryBot.define do
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