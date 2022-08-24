require 'rails_helper'

RSpec.describe User, type: :model do
  it 'does not create an user without name' do
    user = User.create(name: nil,
                       email: 'user@email.com',
                       password: 'password')

    expect(user.errors.messages[:name][0]).to eq("can't be blank")
  end

  it 'does not create two users with the same email' do
    user = create(:user)
    user2 = User.new(name: 'User 2',
                     email: user.email,
                     password: 'password')
    expect { user2.save }.to raise_error(ActiveRecord::RecordNotUnique)
  end
end
