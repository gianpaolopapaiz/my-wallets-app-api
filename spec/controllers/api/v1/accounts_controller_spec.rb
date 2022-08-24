require 'rails_helper'

RSpec.describe Api::V1::AccountsController, type: :request do
  before :each do
    @user = create(:user)
    @account = create(:account, user: @user)
    @account2 = create(:account,
                       name: "Account 2",
                       description: "Account 2 description",
                       user: @user)


  end

  it "INDEX - gets the user account's" do
    post '/users/sign_in', params: { user: { email: @user.email, password: 'password' } }
    # expect(response.body).to eq('')
    get '/api/v1/accounts'
    parsed_body = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(parsed_body.count).to eq(2)
    expect(parsed_body.first['id']).to eq(@account.id)
    expect(parsed_body.last['id']).to eq(@account2.id)
  end
end
