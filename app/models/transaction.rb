class Transaction < ApplicationRecord
  belongs_to :category
  belongs_to :account

  validates :presence, :title
end
