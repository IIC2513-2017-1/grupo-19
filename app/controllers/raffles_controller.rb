class RafflesController < ApplicationController
  before_action :set_raffle, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :creator_user, only: [:edit, :update, :destroy, :draw_raffle]
  before_action :verify_date, only: [:draw_raffle]
  before_action :verify_numbers, only: [:draw_raffle]

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
      redirect_to raffle_winners_path(raffle_id: @raffle.id)
    end
  end

  def index
    @raffles = Raffle.paginate(page:params[:page], :per_page =>10).all
    if params[:search]
      @raffles = Raffle.paginate(page:params[:page], :per_page =>10).search(params[:search]).order("created_at DESC")
    end
    @raffles
  end

  def show
    @prizes = @raffle.prizes
  end

  # GET /raffles/new
  def new
    @raffle = Raffle.new
  end

  # GET /raffles/1/edit
  def edit
  end

  # POST /raffles
  # POST /raffles.json
  def create
    @raffle = Raffle.new(raffle_params)
    @raffle.collected_money = 0
    respond_to do |format|
      if @raffle.save
        for follower in @raffle.user.followers
          notification = Notification.new()
          notification.content = "#{@raffle.user.name} just released the raffle #{@raffle.name}"
          notification.user_id = follower.id
          notification.raffle_id = @raffle.id
          notification.save
        end
        format.html { redirect_to @raffle, notice: 'Raffle was successfully created.' }
        format.json { render :show, status: :created, location: @raffle }
      else
        format.html { render :new }
        format.json { render json: @raffle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /raffles/1
  # PATCH/PUT /raffles/1.json
  def update
    respond_to do |format|
      if @raffle.update(raffle_params)
        for follower in @raffle.user.followers
          notification = Notification.new()
          notification.content = "#{@raffle.user.name} just edited the raffle #{@raffle.name}"
          notification.user_id = follower.id
          notification.raffle_id = @raffle.id
          notification.save
        end
        format.html { redirect_to @raffle, notice: 'Raffle was successfully updated.' }
        format.json { render :show, status: :ok, location: @raffle }
      else
        format.html { render :edit }
        format.json { render json: @raffle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /raffles/1
  # DELETE /raffles/1.json
  def destroy
    @raffle.destroy
    respond_to do |format|
      format.html { redirect_to raffles_url, notice: 'Raffle was successfully destroyed.' }
      format.json { head :no_content }
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

    # Use callbacks to share common setup or constraints between actions.
    def set_raffle
      @raffle = Raffle.find(params[:id])
    end

    def winner_params
      params.require(:winner).permit(:number_id, :prize_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def raffle_params
      params.require(:raffle).permit(:name,
                                     :description,
                                     :price,
                                     :final_date,
                                     :raffle_category_id).merge(user_id: current_user.id)
    end

    def creator_user
      @user = @raffle.user
      redirect_to(root_url) unless (current_user?(@user) || current_user.admin?)
    end
end
