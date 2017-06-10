class NumbersController < ApplicationController
  before_action :set_raffle
  before_action :set_empty_number, only: [:create]
  before_action :set_number, only: [:destroy]
  before_action :logged_in_user, only: [:new, :create, :destroy]
  before_action :owner_user, only: [:destroy]

  # GET /numbers
  # GET /numbers.json
  def index
    @numbers = @raffle.numbers
  end

  # POST /numbers
  # POST /numbers.json
  def create
    @number = Number.new(number_params)
    if !owner_user?
      respond_to do |format|
        if @number.save
          @raffle.collected_money = @raffle.numbers.count * @raffle.price
          @raffle.save
          format.html { redirect_to raffle_numbers_url, notice: 'Number was successfully created.' }
          format.json { render :index, status: :created, location: @number }
        else
          format.html { render :new }
          format.json { render json: @number.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to(root_url)
    end
  end

  # DELETE /numbers/1
  # DELETE /numbers/1.json
  def destroy
    @number.destroy
    respond_to do |format|
      format.html { redirect_to numbers_url, notice: 'Number was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_number
      @number = Number.find(params[:id])
    end

    def set_empty_number
      @number = Number.new
    end

    def set_raffle
      @raffle = Raffle.find(params[:raffle_id])
    end

    def raffle_params
      params.permit(:raffle_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def number_params
      params.permit(:raffle_id).merge(user_id: current_user.id)
    end

    def owner_user?
      @user = User.find(@raffle.user_id)
      current_user == @user
    end
end
