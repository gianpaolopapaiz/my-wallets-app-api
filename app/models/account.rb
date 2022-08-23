class Account < ApplicationRecord
  belongs_to :user

  validate :name, presence: true, uniqueness: { scope: :user_id }
end
