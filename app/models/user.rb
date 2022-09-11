class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :jwt_authenticatable,
         jwt_revocation_strategy: JwtDenylist

  has_many :accounts
  has_many :categories
  validates :name, presence: true
end
