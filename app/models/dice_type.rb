class DiceType < ApplicationRecord
  acts_as_list
  has_many :dice_rolls, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  validates :sides, presence: true, numericality: { only_integer: true, greater_than: 0 }
  scope :ordered, -> { order(position: :asc) }
end
