class DiceRoll < ApplicationRecord
  belongs_to :user
  belongs_to :dice_type
  belongs_to :roll

  validates :dice_type_id, presence: true
end

