require 'test_helper'

class PrizeCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @prize_category = prize_categories(:one)
  end

  test "should get index" do
    get prize_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_prize_category_url
    assert_response :success
  end

  test "should create prize_category" do
    assert_difference('PrizeCategory.count') do
      post prize_categories_url, params: { prize_category: { description: @prize_category.description, name: @prize_category.name } }
    end

    assert_redirected_to prize_category_url(PrizeCategory.last)
  end

  test "should show prize_category" do
    get prize_category_url(@prize_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_prize_category_url(@prize_category)
    assert_response :success
  end

  test "should update prize_category" do
    patch prize_category_url(@prize_category), params: { prize_category: { description: @prize_category.description, name: @prize_category.name } }
    assert_redirected_to prize_category_url(@prize_category)
  end

  test "should destroy prize_category" do
    assert_difference('PrizeCategory.count', -1) do
      delete prize_category_url(@prize_category)
    end

    assert_redirected_to prize_categories_url
  end
end
