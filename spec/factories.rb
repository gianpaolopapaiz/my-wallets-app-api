FactoryBot.define do
  factory(:user) do
    email { 'user@hotmail.com' }
    password { 'password' }
  end

  factory(:account) do
    name { 'Account 1' }
    description { 'Account 1 description' }
  end
end