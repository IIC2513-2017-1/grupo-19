json.extract! raffle, :id, :name, :description, :price, :final_date, :collected_money, :user_id, :raffle_category_id, :created_at, :updated_at
json.url raffle_url(raffle, format: :json)
