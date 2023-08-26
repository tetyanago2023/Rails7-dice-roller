class SetPositionsForDiceType < ActiveRecord::Migration[7.0]
  def change
    DiceType.order(:created_at).each.with_index(1) do |dice_type, index|
      dice_type.update_column :position, index
    end
  end
end
