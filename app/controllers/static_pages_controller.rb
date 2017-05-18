class StaticPagesController < ApplicationController
  def home
    @raffle_categories = RaffleCategory.all
    @prize_categories = PrizeCategory.all
  end

  def help
  end

  def about
  end

  def contact
  end
end
