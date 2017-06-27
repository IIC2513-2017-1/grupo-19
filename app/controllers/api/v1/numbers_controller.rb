module Api::V1
  class NumbersController < ApiController
    before_action :authenticate

    def create
      @number = Number.new(number_params)
      return if @number.save
    end

    def index
      @raffle = Raffle.find(params[:raffle_id])
      @numbers = @raffle.numbers
    end

    private

      # Never trust parameters from the scary internet, only allow the white list through.
      def number_params
        params.permit(:raffle_id).merge(user_id: @current_user.id)
      end
  end
end
