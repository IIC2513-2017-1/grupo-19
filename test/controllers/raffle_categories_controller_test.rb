require 'test_helper'

class RaffleCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @raffle_category = raffle_categories(:one)
  end

  test "should get index" do
    get raffle_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_raffle_category_url
    assert_response :success
  end

  test "should create raffle_category" do
    assert_difference('RaffleCategory.count') do
      post raffle_categories_url, params: { raffle_category: { description: @raffle_category.description, name: @raffle_category.name } }
    end

    assert_redirected_to raffle_category_url(RaffleCategory.last)
  end

  test "should show raffle_category" do
    get raffle_category_url(@raffle_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_raffle_category_url(@raffle_category)
    assert_response :success
  end

  test "should update raffle_category" do
    patch raffle_category_url(@raffle_category), params: { raffle_category: { description: @raffle_category.description, name: @raffle_category.name } }
    assert_redirected_to raffle_category_url(@raffle_category)
  end

  test "should destroy raffle_category" do
    assert_difference('RaffleCategory.count', -1) do
      delete raffle_category_url(@raffle_category)
    end

    assert_redirected_to raffle_categories_url
  end
end
