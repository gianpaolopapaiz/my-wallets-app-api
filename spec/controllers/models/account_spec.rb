require 'rails_helper'

RSpec.describe Api::V1::AccountsController, type: :model do
  before :each do
    @user = create(:user)
    @account = create(:account, user: @user)
  end

  context 'validates name' do
    it 'does not create an account without name' do
      account = Account.create(user: @user,
                            name: nil,
                            description: 'Account 2 description',
                            initial_amount: 15.5)

      expect(account.errors.messages[:name][0]).to eq("can't be blank")
    end

    it 'does not create an account with the same name for the same user' do
      account = Account.create(user: @user,
                               name: 'Account 1',
                               description: 'Account 1 description',
                               initial_amount: 15.5)

      expect(account.errors.messages[:name][0]).to eq("has already been taken")
    end

    it 'creates an account with the same name for different users' do
      accounts_count = Account.all.size
      user2 = create(:user, email: 'user2@email.com')
      account = Account.create(user: user2,
                               name: 'Account 1',
                               description: 'Account 1 description',
                               initial_amount: 15.5)

      expect(Account.all.size).to eq(accounts_count + 1)
      expect(Account.last.name).to eq('Account 1')
    end
  end
end
