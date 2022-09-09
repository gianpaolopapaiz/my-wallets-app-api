# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category, type: :model do
  before :each do
    @user = create(:user)
    @category = create(:category, user: @user)
  end

  context 'validates name' do
    it 'does not create a category without name' do
      category = Category.create(user: @user,
                                 name: nil,
                                 description: 'Category 2 description')

      expect(category.errors.messages[:name][0]).to eq("can't be blank")
    end

    it 'does not create a category with the same name for the same user' do
      category = Category.create(user: @user,
                                 name: 'Category 1',
                                 description: 'Category 1 description')

      expect(category.errors.messages[:name][0]).to eq('has already been taken')
    end

    it 'creates a category with the same name for different users' do
      categories_count = Category.all.size
      user2 = create(:user, email: 'user2@email.com')
      Category.create(user: user2,
                      name: 'Category 1',
                      description: 'Category 1 description')

      expect(Category.all.size).to eq(categories_count + 1)
      expect(Category.last.name).to eq('Category 1')
    end
  end
end
