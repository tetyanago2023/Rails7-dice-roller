class AddPositionToDiceTypes < ActiveRecord::Migration[7.0]
  def change
    add_column :dice_types, :position, :integer
  end
end
