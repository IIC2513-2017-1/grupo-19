module Api::V1
  class UserController < ApiController
    before_action :authenticate

    def show
      @user = User.includes(:raffles, :followers, :followings).find(params[:id])
    end
  end
end
