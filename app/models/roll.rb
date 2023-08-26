class Roll < ApplicationRecord
  belongs_to :user
  has_many :dice_rolls, dependent: :destroy

  accepts_nested_attributes_for :dice_rolls, allow_destroy: true, reject_if: :all_blank
  scope :ordered, -> { order(created_at: :desc) }

  def total
    dice_rolls.map(&:roll_result).sum
  end

  def max_total
    dice_rolls.map { |dice_roll| dice_roll.dice_type.sides * dice_roll.quantity }.sum
  end
end

