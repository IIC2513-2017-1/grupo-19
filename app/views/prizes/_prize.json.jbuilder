json.extract! prize, :id, :name, :description, :raffle_id, :prize_category_id, :created_at, :updated_at
json.url prize_url(prize, format: :json)
