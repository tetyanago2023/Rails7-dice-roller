class PagesController < ApplicationController

  def home
    @dice_types = DiceType.ordered
    # @dice_rolls = current_user.dice_rolls.order(created_at: :desc)
    @rolls = current_user.rolls.ordered

    @roll = current_user.rolls.build
    @roll.dice_rolls.build
  end
end
