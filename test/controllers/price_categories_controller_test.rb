require 'test_helper'

class PriceCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @price_category = price_categories(:one)
  end

  test "should get index" do
    get price_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_price_category_url
    assert_response :success
  end

  test "should create price_category" do
    assert_difference('PriceCategory.count') do
      post price_categories_url, params: { price_category: { description: @price_category.description, name: @price_category.name } }
    end

    assert_redirected_to price_category_url(PriceCategory.last)
  end

  test "should show price_category" do
    get price_category_url(@price_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_price_category_url(@price_category)
    assert_response :success
  end

  test "should update price_category" do
    patch price_category_url(@price_category), params: { price_category: { description: @price_category.description, name: @price_category.name } }
    assert_redirected_to price_category_url(@price_category)
  end

  test "should destroy price_category" do
    assert_difference('PriceCategory.count', -1) do
      delete price_category_url(@price_category)
    end

    assert_redirected_to price_categories_url
  end
end
