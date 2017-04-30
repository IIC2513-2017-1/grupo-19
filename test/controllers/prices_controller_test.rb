require 'test_helper'

class PricesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @price = prices(:one)
    @price_category = price_categories(:one)
    @raffle_category = raffle_categories(:one)
    @user = users(:oscar)
    @raffle = raffles(:one)
    @raffle[:user_id] = @user.id
    @raffle[:raffle_category_id] = @raffle_category.id
    @price[:raffle_id] = @raffle.id
    @price[:price_category_id] = @price_category.id
  end

  test "should get index" do
    get prices_url
    assert_response :success
  end

  test "should get new" do
    get new_price_url
    assert_response :success
  end

  test "should create price" do
    assert_difference('Price.count') do
      post prices_url, params: { price: { description: @price.description,
                                          name: @price.name,
                                          raffle_id: @price.raffle_id,
                                          price_category_id: @price.price_category_id } }
    end

    assert_redirected_to price_url(Price.last)
  end

  test "should show price" do
    get price_url(@price)
    assert_response :success
  end

  test "should get edit" do
    get edit_price_url(@price)
    assert_response :success
  end

  test "should update price" do
    patch price_url(@price), params: { price: { description: @price.description,
                                                name: @price.name,
                                                raffle_id: @price.raffle_id,
                                                price_category_id: @price.price_category_id } }
    assert_redirected_to price_url(@price)
  end

  test "should destroy price" do
    assert_difference('Price.count', -1) do
      delete price_url(@price)
    end

    assert_redirected_to prices_url
  end
end