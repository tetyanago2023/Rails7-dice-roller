class CreateDiceTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :dice_types do |t|
      t.string :name
      t.integer :sides

      t.timestamps
    end
  end
end
