class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { user: 0, admin: 1 }
  has_many :dice_rolls, dependent: :destroy
  has_many :dice_types, dependent: :destroy
  has_many :rolls, dependent: :destroy
end
