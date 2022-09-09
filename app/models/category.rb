# frozen_string_literal: true

class Category < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :user

  validates :name, presence: true, uniqueness: { scope: %i[user_id category_id] }
end
