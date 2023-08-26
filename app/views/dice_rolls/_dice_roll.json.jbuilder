json.extract! dice_roll, :id, :user_id, :dice_type_id, :roll_result, :quantity, :created_at, :updated_at
json.url dice_roll_url(dice_roll, format: :json)
