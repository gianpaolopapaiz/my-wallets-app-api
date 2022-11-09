require 'rails_helper'

RSpec.describe Transaction, type: :model do
  before :each do
    @user = create(:user)
    @account = create(:account, user: @user)
  end

  context 'validates name' do
    it 'does not create a transaction without title' do
      transaction = Transaction.create(title: '',
                                       description: 'Sample description',
                                       account: @account)

      expect(transaction.errors.messages[:title][0]).to eq("can't be blank")
    end

    it 'does not create a transaction without account' do
      transaction = Transaction.create(title: 'Sample Title',
                                       description: 'Sample description',
                                       account: nil)

      expect(transaction.errors.messages[:account_id][0]).to eq("can't be blank")
    end
  end
end
