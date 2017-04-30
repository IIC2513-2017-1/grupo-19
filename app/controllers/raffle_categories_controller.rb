class RaffleCategoriesController < ApplicationController
  before_action :set_raffle_category, only: [:show, :edit, :update, :destroy]

  # GET /raffle_categories
  # GET /raffle_categories.json
  def index
    @raffle_categories = RaffleCategory.all
  end

  # GET /raffle_categories/1
  # GET /raffle_categories/1.json
  def show
  end

  # GET /raffle_categories/new
  def new
    @raffle_category = RaffleCategory.new
  end

  # GET /raffle_categories/1/edit
  def edit
  end

  # POST /raffle_categories
  # POST /raffle_categories.json
  def create
    @raffle_category = RaffleCategory.new(raffle_category_params)

    respond_to do |format|
      if @raffle_category.save
        format.html { redirect_to @raffle_category, notice: 'Raffle category was successfully created.' }
        format.json { render :show, status: :created, location: @raffle_category }
      else
        format.html { render :new }
        format.json { render json: @raffle_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /raffle_categories/1
  # PATCH/PUT /raffle_categories/1.json
  def update
    respond_to do |format|
      if @raffle_category.update(raffle_category_params)
        format.html { redirect_to @raffle_category, notice: 'Raffle category was successfully updated.' }
        format.json { render :show, status: :ok, location: @raffle_category }
      else
        format.html { render :edit }
        format.json { render json: @raffle_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /raffle_categories/1
  # DELETE /raffle_categories/1.json
  def destroy
    @raffle_category.destroy
    respond_to do |format|
      format.html { redirect_to raffle_categories_url, notice: 'Raffle category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_raffle_category
      @raffle_category = RaffleCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def raffle_category_params
      params.require(:raffle_category).permit(:name, :description)
    end
end
