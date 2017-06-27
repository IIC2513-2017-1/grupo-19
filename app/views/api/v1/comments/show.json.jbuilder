# frozen_string_literal: true

json.comment do
  json.href api_v1_comment_url(@comment)
  json.content @comment.content
  json.user do
    json.href api_v1_comment_url(@comment.user)
    json.name @comment.user.name
    json.email @comment.user.email
  end
  json.answered do
    json.href api_v1_comment_url(@comment.answered)
    json.content @comment.answered.content
    json.user do
      json.href api_v1_comment_url(@comment.answered.user)
      json.name @comment.answered.user.name
      json.email @comment.answered.user.email
    end
  end
  json.answers do
    json.array! @comment.answers do |answer|
      json.href api_v1_comment_url(answer))
      json.content answer.content
      json.user do
        json.href api_v1_comment_url(answer.user)
        json.name answer.user.name
        json.email answer.user.email
      end
    end
  end
end
