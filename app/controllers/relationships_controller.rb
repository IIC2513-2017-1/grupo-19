class RelationshipsController < ApplicationController
  before_action :logged_in_user
  before_action :set_user

  def index

  end

  def create
    @relationship = Relationship.new(relationship_params)
    if @relationship.save
      respond_to do |format|
        format.html { redirect_to :back }
        format.json do
          render json: {
            following:{
              id: @relationship.follower_id
            },
            follow: {
              id: @relationship.id
            }
          }
        end
      end
    end

  end

  def destroy
    follow = Relationship.find(params[:id])
    follow.destroy
    respond_to do |format|
      format.html { redirect_to :back }
      format.json do
        render json: {
          unfollowing:{
            user_id: follow.follower_id,
            followed_id: follow.followed_id
          }
        }
      end
    end
  end

  private

    def set_user
      @user = User.find(params[:user_id])
    end

    def relationship_params
      params.require(:relationship).permit(:follower_id, :followed_id)
    end
end
