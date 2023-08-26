require "test_helper"

class DiceRollsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dice_roll = dice_rolls(:one)
  end

  test "should get index" do
    get dice_rolls_url
    assert_response :success
  end

  test "should get new" do
    get new_dice_roll_url
    assert_response :success
  end

  test "should create dice_roll" do
    assert_difference("DiceRoll.count") do
      post dice_rolls_url, params: { dice_roll: { dice_type_id: @dice_roll.dice_type_id, quantity: @dice_roll.quantity, roll_result: @dice_roll.roll_result, user_id: @dice_roll.user_id } }
    end

    assert_redirected_to dice_roll_url(DiceRoll.last)
  end

  test "should show dice_roll" do
    get dice_roll_url(@dice_roll)
    assert_response :success
  end

  test "should get edit" do
    get edit_dice_roll_url(@dice_roll)
    assert_response :success
  end

  test "should update dice_roll" do
    patch dice_roll_url(@dice_roll), params: { dice_roll: { dice_type_id: @dice_roll.dice_type_id, quantity: @dice_roll.quantity, roll_result: @dice_roll.roll_result, user_id: @dice_roll.user_id } }
    assert_redirected_to dice_roll_url(@dice_roll)
  end

  test "should destroy dice_roll" do
    assert_difference("DiceRoll.count", -1) do
      delete dice_roll_url(@dice_roll)
    end

    assert_redirected_to dice_rolls_url
  end
end
