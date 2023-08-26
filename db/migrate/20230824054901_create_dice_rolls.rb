class CreateDiceRolls < ActiveRecord::Migration[7.0]
  def change
    create_table :dice_rolls do |t|
      t.references :user, null: false, foreign_key: true
      t.references :dice_type, null: false, foreign_key: true
      t.integer :roll_result
      t.integer :quantity

      t.timestamps
    end
  end
end
