module PurchasesHelper
  def not_creator_user? (purchase)
    number = Number.find(purchase.number_id)
    raffle = Raffle.find(number.raffle_id)
    user = User.find(raffle.user_id)

    current_user != user
  end
end
