require 'test_helper'

class RafflesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @raffle = raffles(:one)
    @raffle_category = raffle_categories(:one)
    @user = users(:oscar)
    @raffle[:raffle_category_id] = @raffle_category.id
    @raffle[:user_id] = @user.id
    log_in_as(@user)
  end

  test "should get index" do
    get raffles_url
    assert_response :success
  end

  test "should get new" do
    get new_raffle_url
    assert_response :success
  end

  test "should create raffle" do
    assert_difference('Raffle.count') do
      post raffles_url, params: { raffle: { description: @raffle.description,
                                            final_date: @raffle.final_date,
                                            name: "Something wierd",
                                            price: @raffle.price,
                                            raffle_category_id: @raffle_category.id,
                                            user_id: @user.id } }
    end

    assert_redirected_to raffle_url(Raffle.last)
  end

  test "should show raffle" do
    get raffle_url(@raffle)
    assert_response :success
  end

  test "should get edit" do
    get edit_raffle_url(@raffle)
    assert_response :success
  end

  test "should update raffle" do
    patch raffle_url(@raffle), params: { raffle: { description: @raffle.description,
                                                   final_date: @raffle.final_date,
                                                   name: "Something wierd",
                                                   price: @raffle.price,
                                                   raffle_category_id: @raffle.raffle_category_id} }
    assert_redirected_to raffle_url(@raffle)
  end

  test "should destroy raffle" do
    log_in_as(@user)
    assert_difference('Raffle.count', -1) do
      delete raffle_url(@raffle)
    end

    assert_redirected_to raffles_url
  end
end
