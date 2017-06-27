module Api::V1
  class NotificationsController < ApiController
    before_action :authenticate
    before_action :set_raffle

    def create_notifications_for_raffle
      if !@raffle.numbers.blank?
        for number in @raffle.numbers do
          notification = Notification.new(notification_params)
          notification.user = number.user
          notification.raffle = @raffle
          notification.save
        end
      end
    end

    def create_notifications_for_followers
      if !@current_user.followers.blank?
        for follwer in @raffle.followers do
          notification = Notification.new(notification_params)
          notification.user = follower
          notification.raffle = @raffle
          notification.save
        end
      end
    end

    private

    def set_raffle
      @raffle = Raffle.find(params[:raffle_id])
    end

    def notification_params
      params.require(:notification).permit(:content, :seen)
    end

  end
end
