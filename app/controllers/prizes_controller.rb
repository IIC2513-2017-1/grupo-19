class PrizesController < ApplicationController
  before_action :set_prize, only: [:show, :edit, :update, :destroy]
  before_action :set_raffle, only: [:show,
                                    :edit,
                                    :update,
                                    :destroy,
                                    :index,
                                    :new,
                                    :create]

  # GET /prizes
  # GET /prizes.json
  def index
    if params.has_key?(:raffle_id)
      @prizes = Prize.where("raffle_id = #{params[:raffle_id]}")#Prize.all
    elsif params[:search]
        @prizes = Prize.search(params[:search])
    else
      @prizes = Prize.all
    end
  end

  # GET /prizes/1
  # GET /prizes/1.json
  def show
  end

  # GET /prizes/new
  def new
    @prize = Prize.new
  end

  # GET /prizes/1/edit
  def edit
  end

  # POST /prizes
  # POST /prizes.json
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
          format.html { redirect_to @prize.raffle, notice: 'Prize was successfully created.' }
          format.json { render :show, status: :created, location: @prize }
        else
          format.html { render :new }
          format.json { render json: @prize.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to(root_url)
    end
  end

  # PATCH/PUT /prizes/1
  # PATCH/PUT /prizes/1.json
  def update
    respond_to do |format|
      if @prize.update(prize_params)
        for follower in @prize.raffle.user.followers
          notification = Notification.new()
          notification.content = "#{@prize.raffle.user.name} just changed the prize #{@prize.name}, to the raffle #{@prize.raffle.name}"
          notification.user_id = follower.id
          notification.raffle_id = @prize.raffle.id
          notification.save
        end
        format.html { redirect_to @prize.raffle, notice: 'Prize was successfully updated.' }
        format.json { render :show, status: :ok, location: @prize }
      else
        format.html { render :edit }
        format.json { render json: @prize.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prizes/1
  # DELETE /prizes/1.json
  def destroy
    @prize.destroy
    respond_to do |format|
      format.html { redirect_to prizes_url, notice: 'Prize was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prize
      @prize = Prize.find(params[:id])
    end

    def set_raffle
      if params.has_key?(:raffle_id)
        @raffle = Raffle.find(params[:raffle_id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prize_params
      params.require(:prize).permit(:name, :description, :raffle_id, :prize_category_id, :avatar)
    end

    def owner_user?
      @user = User.find(@raffle.user_id)
      current_user == @user
    end
end
