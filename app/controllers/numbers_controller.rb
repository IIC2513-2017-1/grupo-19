class NumbersController < ApplicationController
  before_action :set_number, only: [:destroy]
  before_action :logged_in_user, only: [:new, :create, :destroy]
  before_action :owner_user, only: [:destroy]

  # GET /numbers
  # GET /numbers.json
  def index
    @numbers = Number.all
  end

  # GET /numbers/new
  def new
    @number = Number.new
  end

  # POST /numbers
  # POST /numbers.json
  def create
    @number = Number.new(number_params)

    respond_to do |format|
      if @number.save
        format.html { redirect_to numbers_url, notice: 'Number was successfully created.' }
        format.json { render :index, status: :created, location: @number }
      else
        format.html { render :new }
        format.json { render json: @number.errors, status: :unprocessable_entity }
      end
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def number_params
      params.require(:number).permit(:raffle_id).merge(user_id: current_user.id)
    end

    def owner_user
      @user = User.find_by(id: @number.user_id)
      redirect_to(root_url) unless current_user?(@user)
    end
end
