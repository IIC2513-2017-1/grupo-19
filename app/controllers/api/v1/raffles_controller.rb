module Api::V1
  class RafflesController < ApiController
    before_action :authenticate
    before_action :creator_user,   only: [:draw_raffle]
    before_action :verify_date,    only: [:draw_raffle]
    before_action :verify_numbers, only: [:draw_raffle]

    def index
      @raffles = Raffle.includes(:user, :prizes).all
    end

    def show
      @raffle = Raffle.includes(:user, :prizes).find(params[:raffle_id])
    end

    def create
      @raffle = @current_user.raffles.build(raffle_params)
      @raffle.collected_money = 0
      return if @raffle.save
      render json: {errors: @raffle.errors}, status: :unprocessable_entity
    end

    def draw_raffle
      numbers = @raffle.numbers
      numbers = numbers.shuffle
      if !@raffle.prizes.blank?
        for prize in @raffle.prizes
          numbers = numbers.shuffle
          winnernumber = numbers.shift

          winner = Winner.new()
          winner.number_id = winnernumber.id
          winner.prize_id = prize.id
          winner.save

          notification = Notification.new()
          notification.user_id = winnernumber.user.id
          notification.raffle_id = @raffle.id
          notification.content = "Hey #{winnernumber.user.name}!\n You just won a prize, #{prize.name}, for participating in the raffle \"#{@raffle.name}\"."
          notification.save
        end
        return
      end
    end

    private

      def verify_date
        @raffle = Raffle.find(params[:raffle_id])
        redirect_to :back unless @raffle.final_date < DateTime.now
      end

      def verify_numbers
        @raffle = Raffle.find(params[:raffle_id])
        redirect_to :back unless @raffle.numbers.count > @raffle.prizes.count
      end

      def creator_user
        @user = @raffle.user
        redirect_to(root_url) unless (current_user?(@user) || current_user.admin?)
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def raffle_params
        params.require(:raffle).permit(:name,
                                       :description,
                                       :price,
                                       :final_date,
                                       :raffle_category_id)
      end
  end
end
