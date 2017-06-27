# frozen_string_literal: true

json.comments do
  json.array! @comments do |comment|
    json.href api_v1_comment_url(comment)
    json.content comment.content
    json.user do
      json.href api_v1_user_url(comment.user)
      json.name comment.user.name
      json.email comment.user.email
    end
    json.raffle do
      json.href api_v1_raffle_url(comment.raffle)
      json.name comment.raffle.name
      json.description comment.raffle.description
      json.price comment.raffle.price
      json.final_date comment.raffle.final_date
      json.collected_money comment.raffle.collected_money
      json.raffle_category comment.raffle.raffle_category.name
    end
  end
end
