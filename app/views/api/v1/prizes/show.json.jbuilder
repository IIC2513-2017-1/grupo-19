# frozen_string_literal: true

json.prize do
  json.href api_v1_prize_url(@prize)
  json.name @prize.name
  json.description = @prize.description
  json.raffle do
    json.href api_v1_raffle_url(@prize.raffle)
    json.name @prize.raffle.name
    json.description @prize.raffle.description
    json.price @prize.raffle.price
    json.final_date @raffle.final_date
    json.collected_money @prize.raffle.collected_money
    json.raffle_category @prize.raffle.raffle_category.name
    json.user do
      json.href api_v1_user_url(@prize.raffle.user)
      json.name @prize.raffle.user.name
      json.email @prize.raffle.user.email
    end
  end
end
