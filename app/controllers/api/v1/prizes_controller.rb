module Api::V1
  class PrizesController < ApiController
    before_action :authenticate
    before_action :set_raffle, only: [:create]

    def show
      @prize = Prize.includes(:raffle).find(params[:prize_id])
    end

    def create
      @prize = Prize.new(prize_params)
      @prize.raffle_id = @raffle.id
      if owner_user?
        respond_to do |format|
          if @prize.save
            for follower in @prize.raffle.user.followers
                notification = Notification.new()
                notification.content = "#{@prize.raffle.user.name} just added the prize #{@prize.name}, to the raffle #{@prize.raffle.name}"
                notification.user_id = follower.id
                notification.raffle_id = @prize.raffle.id
                notification.save
              end
          end
        end
      end
    end

    private

      def set_raffle
        if params.has_key?(:raffle_id)
          @raffle = Raffle.find(params[:raffle_id])
        end
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def prize_params
        params.require(:prize).permit(:name, :description, :raffle_id, :prize_category_id)
      end

      def owner_user?
        @current_user == @raffle.user
      end
  end
end
