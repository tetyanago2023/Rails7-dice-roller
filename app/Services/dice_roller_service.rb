class DiceRollerService
  def initialize(roll)
    # Gets the user from the roll
    @roll = roll
    @user = roll.user
    @dice_rolls = roll.dice_rolls
    @dice_types = @dice_rolls.map(&:dice_type)
  end

  def roll_dice
    @dice_rolls.each do |dice_roll|
      dice_roll.roll_result = roll_dice_type(dice_roll.dice_type, dice_roll.quantity)
      dice_roll.user = @user
    end
    @dice_rolls
  end

  def roll_dice_type(dice_type, quantity)
    (1..quantity).map { roll_dice_sides(dice_type.sides)}.sum
  end

  def roll_dice_sides(sides)
    rand(1..sides)
  end
end
