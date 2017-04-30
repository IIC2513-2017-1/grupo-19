require 'test_helper'

class WinnersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @winner = winners(:one)
    @number = numbers(:one)
    @price = prices(:one)
    @winner[:number_id] = @number.id
    @winner[:price_id] = @price.id
  end

  test "should get index" do
    get winners_url
    assert_response :success
  end

  test "should get new" do
    get new_winner_url
    assert_response :success
  end

  test "should create winner" do
    assert_difference('Winner.count') do
      post winners_url, params: { winner: { number_id: @winner.number_id, price_id: @winner.price_id } }
    end

    assert_redirected_to winner_url(Winner.last)
  end

  test "should show winner" do
    get winner_url(@winner)
    assert_response :success
  end

  test "should get edit" do
    get edit_winner_url(@winner)
    assert_response :success
  end

  test "should update winner" do
    patch winner_url(@winner), params: { winner: { number_id: @winner.number_id, price_id: @winner.price_id } }
    assert_redirected_to winner_url(@winner)
  end

  test "should destroy winner" do
    assert_difference('Winner.count', -1) do
      delete winner_url(@winner)
    end

    assert_redirected_to winners_url
  end
end
