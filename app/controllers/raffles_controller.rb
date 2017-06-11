class RafflesController < ApplicationController
  before_action :set_raffle, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :creator_user, only: [:edit, :update, :destroy]
  #before_action :admin_user, only: [:destroy]

  # GET /raffles
  # GET /raffles.json

  def draw_raffle
    @raffle = Raffle.find(params[:raffle_id])
    numbers = @raffle.numbers
    if numbers.length > 0
      number_id = rand(1 .. numbers.length)
    else
      number_id = 1
    end
    prize_id = 1;
    @winner = Winner.create(number_id: number_id, prize_id: prize_id)

        respond_to do |format|
          if @winner.save
            format.html { redirect_to @winner, notice: 'Winner was successfully created.' }
            format.json { render :show, status: :created, location: @winner }
          else
            format.html { render :new }
            format.json { render json: @winner.errors, status: :unprocessable_entity }
          end
        end
  end

  def index
    @raffles = Raffle.paginate(page:params[:page], :per_page =>10).all
    if params[:search]
      @raffles = Raffle.paginate(page:params[:page], :per_page =>10).search(params[:search]).order("created_at DESC")
    end
    @raffles
  end

  # GET /raffles/1
  # GET /raffles/1.json
  def show
    @prizes = []
    @raffle.prizes.each do |prize|
      @prizes << Prize.find(prize)
    end
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
    respond_to do |format|
      if @raffle.save
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
      #@user = User.find_by(id: @raffle.user_id)
      @user = @raffle.user
      redirect_to(root_url) unless (current_user?(@user) || current_user.admin?)
    end
end
