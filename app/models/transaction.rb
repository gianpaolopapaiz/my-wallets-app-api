class Transaction < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :account

  validates :title, :account_id, presence: true
end
