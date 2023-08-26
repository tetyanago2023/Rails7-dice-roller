require "test_helper"

class DiceTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dice_type = dice_types(:one)
  end

  test "should get index" do
    get dice_types_url
    assert_response :success
  end

  test "should get new" do
    get new_dice_type_url
    assert_response :success
  end

  test "should create dice_type" do
    assert_difference("DiceType.count") do
      post dice_types_url, params: { dice_type: { name: @dice_type.name, sides: @dice_type.sides } }
    end

    assert_redirected_to dice_type_url(DiceType.last)
  end

  test "should show dice_type" do
    get dice_type_url(@dice_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_dice_type_url(@dice_type)
    assert_response :success
  end

  test "should update dice_type" do
    patch dice_type_url(@dice_type), params: { dice_type: { name: @dice_type.name, sides: @dice_type.sides } }
    assert_redirected_to dice_type_url(@dice_type)
  end

  test "should destroy dice_type" do
    assert_difference("DiceType.count", -1) do
      delete dice_type_url(@dice_type)
    end

    assert_redirected_to dice_types_url
  end
end
