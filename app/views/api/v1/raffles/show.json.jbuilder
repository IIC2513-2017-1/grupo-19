# frozen_string_literal: true

json.raffle do
  json.href api_v1_raffle_url(@raffle)
  json.name @raffle.name
  json.description @raffle.description
  json.price @raffle.price
  json.final_date @raffle.final_date
  json.collected_money @raffle.collected_money
  json.raffle_category @raffle.raffle_category.name
  json.user do
    json.href api_v1_user_url(@raffle.user)
    json.name @raffle.user.name
    json.email @raffle.user.email
  end
  json.prizes do
    json.array! @raffle.prizes do |prize|
      json.href api_v1_prize_url(prize)
      json.name prize.name
      json.description = prize.description
    end
  end
end
