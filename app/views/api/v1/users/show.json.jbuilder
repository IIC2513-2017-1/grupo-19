# frozen_string_literal: true

json.user do
  json.href api_v1_user_url(@user)
  json.name @user.name
  json.email @user.email
  json.raffles do
    json.array! @user.raffles do |raffle|
      json.href api_v1_raffle_url(raffle)
      json.name raffle.name
      json.description raffle.description
      json.price raffle.price
      json.final_date raffle.final_date
      json.collected_money raffle.collected_money
    end
  end
  json.followers do
    json.array! @user.followers do |follower|
      json.href api_v1_user_url(follower)
      json.name follower.name
      json.email follower.email
    end
  end
  json.followings do
    json.array! @user.followings do |following|
      json.href api_v1_user_url(following)
      json.name following.name
      json.email following.email
    end
  end
end
