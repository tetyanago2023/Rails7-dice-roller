class DiceRollsController < ApplicationController

  # POST /dice_rolls or /dice_rolls.json
  def create
    @roll = current_user.rolls.build(dice_roll_params)
    @roll.dice_rolls = DiceRollerService.new(@roll).roll_dice

    respond_to do |format|
      if @roll.save
        format.turbo_stream
        format.html { redirect_to root_path, notice: "Roll was successfully created." }
      end
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def dice_roll_params
    params.require(:roll).permit(dice_rolls_attributes: %i[id _destroy dice_type_id quantity])
  end
end
