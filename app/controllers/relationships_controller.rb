class RelationshipsController < ApplicationController
  before_action :logged_in_user
  before_action :set_user

  def index

  end

  def create
    @relationship = Relationship.new(relationship_params)
    if @relationship.save
      redirect_to :back
    end

  end

  def destroy
    Relationship.find(params[:id]).destroy
    redirect_to :back
  end

  private

    def set_user
      @user = User.find(params[:user_id])
    end

    def relationship_params
      params.require(:relationship).permit(:follower_id, :followed_id)
    end
end
